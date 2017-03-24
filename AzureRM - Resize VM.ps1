﻿#-------------------------------------------------------------------------
# Copyright (c) Microsoft.  All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#--------------------------------------------------------------------------

# Import Minimum Required Module Version(s)

    Import-Module `
        -Name AzureRM.Compute `
        -MinimumVersion 2.8.0

# Select Azure Cloud Environment

    $azureEnv = 
        (Get-AzureRmEnvironment).Name |
        Out-GridView `
            -Title "Select Azure Environment ..." `
            -PassThru

# Sign-in to ARM with Azure account credentials

    Login-AzureRmAccount `
        -EnvironmentName $azureEnv

# Select Azure Subscription

    $subscriptionId = 
        (Get-AzureRmSubscription |
         Out-GridView `
            -Title "Select an Azure Subscription ..." `
            -PassThru).SubscriptionId

    Select-AzureRmSubscription `
        -SubscriptionId $subscriptionId

# Select Azure Resource Group 

    $rgName =
        (Get-AzureRmResourceGroup |
         Out-GridView `
            -Title "Select an Azure Resource Group ..." `
            -PassThru).ResourceGroupName
         Out-GridView `
            -Title "Select an Azure VM ..." `
            -PassThru).Name
            -Title "Select a new VM Size ..." `
            -PassThru