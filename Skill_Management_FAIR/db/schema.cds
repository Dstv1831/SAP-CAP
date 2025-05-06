namespace skill.management.fair;

using {
    cuid,
    managed,
} from '@sap/cds/common';

entity Employees : cuid, managed {
    firstName: String(16);
    lastName: String(16);
    practice: Association to Practices;
    seniority: Association to Seniorities;
    office: Association to Offices;
    employment: Employment;
    role: Role;
    email: String(64);
    salary: Decimal;
    employeeSkills: Composition of many EmployeeSkills on employeeSkills.employee = $self;
    employeeDevPlan: Composition of many DevelopmentPlans on employeeDevPlan.employee = $self;
}

entity EmployeeSkills : cuid, managed {
    employee: Association to Employees;
    skill: Association to Skills;
    levelCode: LevelCode;
    interestCode: InterestCode;
  
}
entity Skills : cuid, managed {
    skillCode: String(32);
    description: String(128);
    parentSkill: Association to Skills;

}
entity Practices : cuid, managed {
    teamCode: String(3);
    description: String(32);
}
entity Seniorities : cuid, managed {
    jobCode: Seniority;
    description: String(32);

}
entity Offices : cuid, managed {
    officeCode: Office;
    description: String(32);
}
entity Projects : cuid, managed {
    name: String(32);
    customer: String(16);
    startDate: Date;
    endDate: Date;
    budget: Decimal;
}
entity ProjectResources : cuid, managed {
    project: Association to Projects;
    employee: Association to Employees;
    status: Status;
}
entity DevelopmentPlans : cuid, managed {
    employee: Association to Employees;
    skill: Association to Skills;
    status: Status;
}

// ENUMERATIONS TYPES

type Employment : String enum {
    FT = 'Full Time';
    PT = 'Part Time';
    CAS = 'Casual';
    CTR = 'Contractor';
    INT = 'Intern';
    INA = 'Inactive';
}

type Role : Integer enum {
    admin = 1;
    manager = 2;
    user = 3;
}

type LevelCode : Integer enum {
    NONE = 1;
    BASIC = 2;
    INTERMEDIATE = 3;
    ADVANCED = 4;
    EXPERT = 5;
}

type InterestCode : Integer enum {
    no_interest = 1;
    low_interest = 2;
    neutral = 3;
    interested = 4;
    highly_interested = 5;
}

type Seniority : String enum {
    INT = 'Intern';
    JUN = 'Junior';
    MID = 'Mid-level';
    SEN = 'Senior';
    ASC = 'Associate';
    CON = 'Consultant';
    DIR = 'Director';
    MAN = 'Manager';
    PRN = 'Principal';
    SENC = 'Senior Consultant';
}

type Office : String enum {
    ADE = 'Adelaide';
    BRI = 'Brisbane';
    MEL = 'Melbourne';
    PK = 'Pakistan';
    SYD = 'Sydney';
}

type Status : String enum {
    PEN = 'Pending';
    APP = 'Approved';
    CAN = 'Cancelled';
    HLD = 'On Hold';
    IPR = 'In Progress';
    COM = 'Completed';
    REJ = 'Rejected';
}


// entity Plan_Skills : cuid, managed {

// }

// Maybe use create Epochs to Set values that cant be different




