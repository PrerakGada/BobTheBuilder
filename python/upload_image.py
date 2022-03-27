# -*- coding: utf-8 -*-
"""
Created on Sun Mar 27 02:50:30 2022

@author: Esha
"""

import os
import boto3
from botocore.exceptions import ClientError

access_key='AKIA3J5S566A27HYQ7XK'
access_secret='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'
bucket_name='bucket1bobthebuilder'

client_s3=boto3.client(
    's3',
    aws_access_key_id=access_key,
    aws_secret_access_key=access_secret
    )


data_file_folder=os.path.join(os.getcwd())
for file in os.listdir(data_file_folder):
                       if not file.startswith('~'):
                           try:
                               print('Uploading files(0)...',format(file))
                               client_s3.upload_file(
                                   os.path.join(data_file_folder,file),
                                   bucket_name,
                                   file
                                   )
                           except ClientError as e:
                            print('Credential is incorrect')
                            print(e)
                           except Exception as e:
                            print(e)
                            
                               
                    
