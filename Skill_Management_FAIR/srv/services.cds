using skill.management.fair as db from '../db/schema';

//Serves Administrators

service AdminService @(path: '/admin') {
    entity Employees as projection on db.Employees;
    entity Skills as projection on db.Skills;
    entity Practices as projection on db.Practices;
    entity Seniorities as projection on db.Seniorities;
    entity Offices as projection on db.Offices;
}


//Serves Managers


//Serves Users