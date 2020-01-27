# Specification for Email Campaign Management System

## Overview
---

Emails are part of a modern marketing campaign, and requires sending of emails in volume to hundreds of users without spamming, causing disturbance or violating their privacy. Emails has become an important component of every digital marketing plan because of its effectiveness in driving conversions and building brand loyalty. As the campaign scales to encompass a larger audience, it becomes critical to manage emails with reliability. Each campaign has a different motive and target audience. A suitable way to manage the emails per campaign with its date and contact list becomes necessary when the campaigns are maintained for a long period of time.

## User Roles
---

The following are the user roles of **Email Campaign Management System**
 
 - `Campaign Managers` - This user only creates campaigns with minimally required information.
 
 - `Contact Collectors` - This user creates customer contact and contact list and makes it available.
 
 - `Administrator Users` - Administrator Users has privileges to access all functionalities of the system and
                         are responsible for the management, upkeep and configuration of the system.

 - `Anonymous Users` - Anonymous Users should not be able to view the contents of the website.


## Users for demo
---

1. Username: `admin`, Password: `password`, Role: `admin`, email: `admin@admin.com`
2. Username: `developers`, Password: `password`, Role: `admin`, email: `aazhbd@conveylive.com`
3. Username: `tasneem`, Password: `password`, Role: `admin`
4. Username: `contactmanager`, Password: `password`, Role: `Contact Collectors`
5. Username: `campainer`, Password: `password`, Role: `Campaign Managers`
6. Username: `lakshmi`, Password: `password`, Role: `Campaign Managers`
7. Username: `sheila`, Password: `password`, Role: `Campaign Managers`




## Features
---


 - User can login and logout from the system.

 - All users can see status of campaigns after login.

 - Campaign Managers can create/update Email Campaigns.

 - Campaign Managers can send campaign emails

 - Contact Collectors can create/update Contact Details.
 
 - Contact Collectors can add email addresses to Contacts in Contact List.

 - Administrator users can delete Email Campaigns, Email Templates, Contact and Contact List.

 - Administrator users can create users with diffrent user permissions.
 
 - Administrator users can create user groups with different user roles.

 - Command functionality is available for adding schedule jobs to send campaigns.

 - Backend API is avilable for Mobile App

 - Mobile App has functionality to send campaigns and show campaign details.

