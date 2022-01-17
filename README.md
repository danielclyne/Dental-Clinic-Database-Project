Dental Clinic Database

The Dental Clinic database consists of 14 tables. All the tables have a unique primary key to identify each record and allow it to be referenced as a foreign key in another table. The tables created will allow the user to use the database as per the requirements of the narrative.

Patient: This table holds the personal information of the patients including their first name, last name, date of birth and foreign keys which reference the address and contact information tables.
Every time a new patient registers with the clinic their information is inserted into this table.

Dentist: This table holds the personal information of the dentist including her first name, last name and foreign keys which reference the address and contact information tables.
There is currently one dentist at the clinic. More dentists can be inserted into the table if the clinic expands.

Specialist: This table holds the personal information of the specialists including their specialisation, first name, last name and foreign keys which reference the address and contact information tables.

Address: This table holds the address information for each person registered on the database including the patients addresses and the dentist and specialist clinic addresses. The data included is address lines, town, county, post code and country.

Contact Information: This table holds the contact information for each person registered on the database including the patients, the dentist and the specialists. This includes a phone number and an email address.

Treatment: This table holds information on the treatments available at the clinic. This includes treatment type, a description of the treatment and the current price of the treatment.

Appointment: When a patient books an appointment the details are inserted into this table. The appointment table has foreign keys which reference the patient that holds the appointment and the dentist that will examine the patient.
It also holds the date and time of the appointment and refers to a previous appointment should it be a follow up. There is also data on the total price of the appointment and boolean types which declare whether the appointment has been paid for in full and if the appointment has been cancelled.

Appointment Details: This table holds data on the treatments received by the patient during an appointment. The table references the appointment to which the treatment was performed and the treatment itself along with the quantity of each treatment and the price of the treatment at that point in time. The total treatment price is calculated by multiplying the single treatment price and treatment quantity.
Each unique treatment is added to the table in its own row.
The total appointment price in the appointment table can be retrieved from getting the sum of each total treatment price attached to an appointment.
Should the price of a treatment change at the clinic this can be updated in the treatment table and it will not affect the records of treatments that have already been performed in this table.

Patient Chart: This table holds data on the patient following each appointment. Each row in the table has a foreign key which references the patient and the appointment. It also holds a record of the appointment report from the dentist. Should the patient be referred to a specialist a foreign key references the specialist who the patient has been referred to.
A foreign key also references a specialist report which is logged in the specialist report table when the specialist sends the report to the clinic after consultation with the patient.

Specialist Report: This table holds data on the specialist reports sent to the clinic after the patient has had a specialist consultation.
When the clinic receives a report from a specialist it is logged in this table under the report details column. The table also references the specialist who sent the report and the appointment from which the referral came.

Patient Ledger: This table keeps records of all transactions with the patients.
Each row references the patient and the appointment to which the transaction is attached to along with the entry type and the amount either owed or paid.
The entry type column references the entry type table and determines whether the ledger entry is a service charge, a late cancellation fee, a full payment or a partial payment. When payments are recorded in the ledger the sum of the amount column will show how much is still owed. This can be grouped by appointment or patient should a patient owe for multiple appointments.
The ledger also records the date and time of each ledger entry.

Payment: This table holds data on each payment made by the patient.
The table references the ledger entry to which the payment is attached to and the patient who has made the payment. It also records the payment type (Cash, Card, Cheque) and the amount along with a timestamp to record the payment date and time and a payment Id.

Ledger Entry Type: This table holds data on the ledger entry types. Each entry type has a unique primary key.

Payment Type: This table holds data on payment types. Each payment type has a unique primary key.

Function: getAppointmentAmountDue
I included a function which calculates the amount due on each appointment. This function returns the sum of the amount column from the patient ledger based on the appointmentId.

Trigger: patientledger_after_insert
I included a trigger which changes the boolean value isFullyPaid in the appointment table to 1 when the amount due in the ledger for an appointment reaches 0. The trigger checks the amount after each insert into the patient ledger based on the entries appointmentId.

I have included query examples along with comments in the SQL script (Queries) which demonstrate how the database can be used.
