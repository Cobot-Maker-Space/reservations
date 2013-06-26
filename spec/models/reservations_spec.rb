require 'spec_helper'

describe Reservation do
	subject(:reservation) { FactoryGirl.build(:reservation) }

	context "when valid" do
		it { should be_valid }
		it 'should have a valid reserver' do
			reservation.reserver.should_not be_nil
			reservation.reserver.first_name.should_not == "Deleted"
		end
		its(:equipment_model) { should_not be_nil }
		its(:start_date) { should_not be_nil }
		its(:due_date) { should_not be_nil }
		it 'should save' do
			reservation.save.should be_true
			Reservation.all.size.should == 1
			Reservation.all.first.should == reservation
		end
		it 'can be updated' do
			reservation.due_date = Date.tomorrow + 1
			reservation.save.should be_true
		end
		it 'passes custom validations' do
			reservation.should be_no_overdue_reservations
			reservation.should be_start_date_before_due_date
			reservation.should be_not_in_past
			reservation.should be_not_empty
			reservation.should be_matched_object_and_model #how is this passing without an equipment object??
			reservation.should be_duration_allowed
			reservation.should be_start_date_is_not_blackout
			reservation.should be_due_date_is_not_blackout
			reservation.should be_available #how is this passing without an equipment object??
			reservation.should be_quantity_eq_model_allowed
			reservation.should be_quantity_cat_allowed
			Reservation.validate_set(reservation.reserver).should == []
		end
		context "when not checked out" do
			its(:status) { should == 'reserved' }
			#it { should_not be_is_eligible_for_renew } currently returns true; doesn't check for checked out
		end
		it { should respond_to(:fake_reserver_id) }
		it { should respond_to(:late_fee) }
		it { should respond_to(:max_renewal_length_available) }
	end

	context 'when empty' do
		subject(:reservation) { FactoryGirl.build(:reservation, equipment_model: nil) }

		it { should_not be_valid }
		it 'should not save' do
			reservation.save.should be_false
			Reservation.all.size.should == 0
		end
		it 'cannot be updated' do
			reservation.start_date = Date.tomorrow
			reservation.save.should be_false
		end
		it 'fails appropriate validation' do
			reservation.should_not be_not_empty
		end
		it 'passes other custom validations' do
			reservation.should be_no_overdue_reservations
			reservation.should be_start_date_before_due_date
			reservation.should be_not_in_past
			reservation.should be_matched_object_and_model
			#reservation.should be_duration_allowed
			reservation.should be_start_date_is_not_blackout
			reservation.should be_due_date_is_not_blackout
			#reservation.should be_available
			#reservation.should be_quantity_eq_model_allowed
			#reservation.should be_quantity_cat_allowed
			#Reservation.validate_set(reservation.reserver).should_not == []
		end
		it 'updates with equipment model' do
			reservation.equipment_model = FactoryGirl.build(:equipment_model)
			reservation.save.should be_true
			reservation.should be_valid
			Reservation.all.size.should == 1
		end
	end

	context 'with past due date' do
		subject(:reservation) { FactoryGirl.build(:reservation, due_date: Date.yesterday) }

		it { should_not be_valid }
		it 'should not save' do
			reservation.save.should be_false
			Reservation.all.size.should == 0
		end
		it 'cannot be updated' do
			reservation.start_date = Date.tomorrow
			reservation.save.should be_false
		end
		it 'fails appropriate validations' do
			reservation.should_not be_start_date_before_due_date
			reservation.should_not be_not_in_past
		end
		it 'passes other custom validations' do
			reservation.should be_no_overdue_reservations
			reservation.should be_not_empty
			reservation.should be_matched_object_and_model
			reservation.should be_duration_allowed
			reservation.should be_start_date_is_not_blackout
			reservation.should be_due_date_is_not_blackout
			reservation.should be_available
			reservation.should be_quantity_eq_model_allowed
			reservation.should be_quantity_cat_allowed
			#Reservation.validate_set(reservation.reserver).should_not == []
		end
		it 'updates with fixed date' do
			reservation.due_date = Date.tomorrow
			reservation.save.should be_true
			reservation.should be_valid
			Reservation.all.size.should == 1
		end
	end

	context 'with blacked out start date' do
		let!(:blackout) { FactoryGirl.create(
			:black_out, start_date: reservation.start_date, end_date: reservation.due_date)
		}

		it { should_not be_valid }
		it 'should not save' do
			reservation.save.should be_false
			Reservation.all.size.should == 0
		end
		it 'cannot be updated' do
			reservation.start_date = Date.tomorrow
			reservation.save.should be_false
		end
		it 'fails appropriate validations' do
			reservation.should_not be_start_date_is_not_blackout
			reservation.should_not be_due_date_is_not_blackout
		end
		it 'passes other custom validations' do
			reservation.should be_start_date_before_due_date
			reservation.should be_not_in_past
			reservation.should be_no_overdue_reservations
			reservation.should be_not_empty
			reservation.should be_matched_object_and_model
			reservation.should be_duration_allowed
			reservation.should be_available
			reservation.should be_quantity_eq_model_allowed
			reservation.should be_quantity_cat_allowed
			#Reservation.validate_set(reservation.reserver).should_not == []
		end
	end

	context 'with no user' do
		subject(:reservation) { FactoryGirl.build(:reservation, reserver: nil) }

		it 'should have a deleted user' do
			reservation.reserver.should_not be_nil
			reservation.reserver.first_name.should == "Deleted"
		end
		it { should be_valid }
	end

	context 'when user has overdue reservation' do
		subject(:reservation) { FactoryGirl.build(:reservation) }
		let(:overdue_reserver) { reservation.reserver }
		let!(:overdue) {
			o = FactoryGirl.build(:overdue_reservation, reserver: overdue_reserver, equipment_model: reservation.equipment_model)
			o.save(validate: false)
			o
		}

		it { should_not be_valid }
		it 'should not save' do
			reservation.save.should be_false
			Reservation.all.size.should == 1
			Reservation.all.first.should == overdue
		end
		it 'cannot be updated' do
			reservation.start_date = Date.tomorrow
			reservation.save.should be_false
		end
		it 'fails appropriate validation' do
			reservation.should_not be_no_overdue_reservations
		end
		it 'passes other custom validations' do
			reservation.should be_start_date_before_due_date
			reservation.should be_not_in_past
			reservation.should be_not_empty
			reservation.should be_matched_object_and_model
			reservation.should be_duration_allowed
			reservation.should be_start_date_is_not_blackout
			reservation.should be_due_date_is_not_blackout
			reservation.should be_available
			reservation.should be_quantity_eq_model_allowed
			reservation.should be_quantity_cat_allowed
			#Reservation.validate_set(reservation.reserver).should_not == []
		end
	end

end