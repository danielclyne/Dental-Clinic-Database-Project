/* SHOW AMOUNT OWED BY ALL PATIENTS */
SELECT patient.patientId, patient.firstName, patient.lastName, sum(amount) FROM patient INNER JOIN patientledger ON patient.patientId = patientledger.patientId GROUP BY patientId;

/* SHOW AMOUNT OWED BY A SPECIFIC PATIENT */
SELECT sum(amount) FROM patientledger WHERE patientId = 1;

/* SHOW IF AN APPOINTMENT IS PAID FOR A SPECIFIC PATIENT FROM A SPECIFIC DATE */
SELECT patientId, appointmentId, date, isFullyPaid FROM appointment WHERE appointment.patientId = 1 AND appointment.date < '2021-03=09';

/* CHANGE APPOINTMENT DATE AND TIME FOR A SPECIFIC PATIENT*/
UPDATE appointment SET date = '2021-04-05', time = '09:30' WHERE appointmentId = 1;

/* SET APPOINTMENT AS CANCELLED AND INSERT LATE CANCELLATION FEE INTO PATIENT LEDGER*/
UPDATE appointment SET isCancelled = 1 WHERE AppointmentId = 1;

insert into patientLedger (patientId, appointmentId, entryType, amount) values
(7, 1, 2, 10.00);

/* LISTING PATIENTS/ APPOINTMENT DETAILS FOR PATIENTS WHO HAVE APPOINTMENTS IN A CERTAIN WEEK TO POST A REMINDER */
SELECT patient.firstName, patient.lastName, address.addressLine1, address.town, address.county, address.postCode, address.country, appointment.date, appointment.time FROM patient INNER JOIN address ON patient.address = address.addressId INNER JOIN appointment ON patient.patientId = appointment.appointmentId WHERE appointment.date BETWEEN '2021-3-08' AND '2021-03-14';

/* UPDATING ALL TREATMENT FEES BY 100 */
UPDATE treatment SET treatmentPrice = treatmentPrice + 100;

/* BILL PREPERATION LISTS REMAINING AMOUNT TO PAY PER APPOINTMENT */
SELECT patient.patientId, patient.firstName, patient.lastName, patientledger.appointmentId, sum(amount) FROM patient INNER JOIN patientledger ON patient.patientId = patientledger.patientId GROUP BY appointmentId ORDER BY patientId;

/* PAYMENT LOG LISTS APPOINTMENT AMOUNT AND PAYMENTS MADE PER APPOINTMENT WITH PAYMENT TYPE (PARTIAL/FULL) and PAYMENT DATE */
SELECT patientledger.patientId, patientledger.appointmentId, patientledger.entryType, patientledger.amount, payment.paymentAmount, payment.paymentDateTime FROM patientledger LEFT JOIN payment ON patientledger.ledgerId = payment.ledgerId ORDER BY appointmentId;

/* VISIT CARD/ APPOINTMENT REPORT LISTS THE TREATMENTS AND THE DENTAL REPORTS BY APPOINTMENT */
SELECT appointmentdetails.appointmentId, treatment.treatmentType, appointmentdetails.treatmentQuantity, patientchart.appointmentReport FROM treatment INNER JOIN appointmentdetails ON appointmentdetails.treatmentId = treatment.treatmentId INNER JOIN patientchart ON appointmentdetails.appointmentId = patientchart.appointmentId ORDER BY appointmentdetails.appointmentId;

/* SPECIALIST REFERRAL/ REPORT LISTS THE PATIENT, APPOINTMENT AND SPECIALIST REFERRED TO ASWELL AS THE SPECIALIST REPORT */
SELECT patientchart.patientId, patientchart.appointmentId, patientchart.referredToSpecialist, specialistreport.reportDetails FROM patientchart LEFT JOIN specialistreport ON patientchart.appointmentId = specialistreport.appointmentId ORDER BY patientchart.patientId;


/* INSERT EXAMPLE */
INSERT INTO patient (firstName, lastName, dateOfBirth) VALUES
('Helen', 'Joyce', '1971-04-12'),
('Elijah', 'Short', '1962-08-11'),
('Robert', 'Creedon', '1998-07-04');

/* UPDATE EXAMPLE */
UPDATE patient SET lastName = 'Jameson' WHERE patientId = 15;

/* DELETE EXAMPLE */
DELETE FROM appointmentdetails WHERE appointmentId = 1 AND treatmentId = 4;