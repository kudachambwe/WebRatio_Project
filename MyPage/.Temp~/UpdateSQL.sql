-- Group [Group]
create table `group_4` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module_4` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user_4` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Course [ent1]
create table `kuda_course` (
   `course_id`  varchar(255)  not null,
   `course_name`  varchar(255),
   `course_year`  varchar(255),
  primary key (`course_id`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group_4`  add column  `module_4_oid`  integer;
alter table `group_4`   add index fk_group_4_module_4 (`module_4_oid`), add constraint fk_group_4_module_4 foreign key (`module_4_oid`) references `module_4` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module_4` (
   `group_4_oid`  integer not null,
   `module_4_oid`  integer not null,
  primary key (`group_4_oid`, `module_4_oid`)
);
alter table `group_module_4`   add index fk_group_module_4_group_4 (`group_4_oid`), add constraint fk_group_module_4_group_4 foreign key (`group_4_oid`) references `group_4` (`oid`);
alter table `group_module_4`   add index fk_group_module_4_module_4 (`module_4_oid`), add constraint fk_group_module_4_module_4 foreign key (`module_4_oid`) references `module_4` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user_4`  add column  `group_4_oid`  integer;
alter table `user_4`   add index fk_user_4_group_4 (`group_4_oid`), add constraint fk_user_4_group_4 foreign key (`group_4_oid`) references `group_4` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group_4` (
   `user_4_oid`  integer not null,
   `group_4_oid`  integer not null,
  primary key (`user_4_oid`, `group_4_oid`)
);
alter table `user_group_4`   add index fk_user_group_4_user_4 (`user_4_oid`), add constraint fk_user_group_4_user_4 foreign key (`user_4_oid`) references `user_4` (`oid`);
alter table `user_group_4`   add index fk_user_group_4_group_4 (`group_4_oid`), add constraint fk_user_group_4_group_4 foreign key (`group_4_oid`) references `group_4` (`oid`);


