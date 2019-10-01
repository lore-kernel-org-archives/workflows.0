Return-Path: <SRS0=W/h6=X2=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD3BECE589
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 04:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E935421872
	for <workflows@archiver.kernel.org>; Tue,  1 Oct 2019 04:50:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbfJAEur (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 1 Oct 2019 00:50:47 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:54502 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725535AbfJAEur (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 1 Oct 2019 00:50:47 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x914lZm1074828
        for <workflows@vger.kernel.org>; Tue, 1 Oct 2019 00:50:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2vbyjersym-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <workflows@vger.kernel.org>; Tue, 01 Oct 2019 00:50:46 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <workflows@vger.kernel.org> from <ajd@linux.ibm.com>;
        Tue, 1 Oct 2019 05:50:44 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 1 Oct 2019 05:50:40 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x914odR856623200
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 1 Oct 2019 04:50:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AE908A405B;
        Tue,  1 Oct 2019 04:50:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5B1BCA4060;
        Tue,  1 Oct 2019 04:50:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
        by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue,  1 Oct 2019 04:50:39 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
        (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
        (No client certificate requested)
        by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 87620A00F8;
        Tue,  1 Oct 2019 14:50:35 +1000 (AEST)
Subject: Re: Kernel development collaboration platform wish list
To:     Daniel Axtens <dja@axtens.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, workflows@vger.kernel.org
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <1811089.yxvLMk49Ug@kreacher> <5072394.GngetUhsyG@kreacher>
 <87blv13yxc.fsf@dja-thinkpad.axtens.net>
From:   Andrew Donnellan <ajd@linux.ibm.com>
Date:   Tue, 1 Oct 2019 14:50:35 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87blv13yxc.fsf@dja-thinkpad.axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19100104-0008-0000-0000-0000031C9EFA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19100104-0009-0000-0000-00004A3B4779
Message-Id: <522b803e-027e-e809-5dfa-826861344bd1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-10-01_03:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010047
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On 1/10/19 5:52 am, Daniel Axtens wrote:
>> (d) Support for "maintainer views"
>>
>>      That is, by default subsystem maintainers should see patches, bug reports
>>      etc against the code maintained by them, with the possibility to extend the
>>      view to also see the other submissions.
>>
>>      [That kind of is the case in Patchwork today when patches sent to different
>>       mailing lists show up under different "projects", but the problem in there
>>       is that copies of one patch appear under multiple "projects" as different
>>       entities if sent to multiple lists.]
> 
> /me puts on pw maintainer hat
> 
> This is true, they are each individual database entries. This is largely
> because projects will often change the state of patches differently. (An
> example is a patch sent to multiple lists to collect ACKs before being
> merged.)

We really should get around to adding inter-project links for matching 
message-IDs.

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

