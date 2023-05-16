package com.dodam.hotel.repository.model;

import java.sql.Date;

public class Reservation {
    private Integer id;
    private Date start_date;
    private Date end_date;
    private Integer numberOfp;
    private TestUser user;
    private Room room;
    private TestDining dining;
    private TestPackage h_package;
    private TestFitness fitness;
    private TestPool pool;
    private TestSpa spa;
}
