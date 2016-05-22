# opendkim

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with opendkim](#setup)
    * [Setup requirements](#setup-requirements)

## Overview

This is an OpenDKIM module for CentOS/RHEL 6/7. OpenDKIM is used for e-mail authentication.

## Module Description

This module installs and configures OpenDKIM. You can pass arguments via puppet profile or via hiera.

## Setup

### Setup Requirements **OPTIONAL**

In order for this to work, you'll need to enter an smtpd_milter in your Postfix configuration so that outgoing mail is signed.
