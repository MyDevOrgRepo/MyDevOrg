global class attendaceSchedular implements Schedulable
{

    global void execute(SchedulableContext SC)
    {
        changeAttendanceReportCheckBox carcbk = new changeAttendanceReportCheckBox ();
        database.executeBatch(carcbk);
    }

}