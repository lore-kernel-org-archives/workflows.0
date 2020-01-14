Return-Path: <SRS0=QiH3=3D=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EC3C33CB1
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E6A112467C
	for <workflows@archiver.kernel.org>; Tue, 14 Jan 2020 13:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgANNFy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 14 Jan 2020 08:05:54 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:23032 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728057AbgANNFy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 14 Jan 2020 08:05:54 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00ED3EV5125483
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 08:05:53 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2xhbprdy61-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 08:05:53 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 00ED55RB010100
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:52 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma02dal.us.ibm.com with ESMTP id 2xf74p2s39-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 00ED5pYQ53543342
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:51 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 42C27AE064
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 60E61AE063
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:50 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.105.10])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP
        for <workflows@vger.kernel.org>; Tue, 14 Jan 2020 13:05:50 +0000 (GMT)
X-Mailer: emacs 27.0.60 (via feedmail 11-beta-1 I)
From:   "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To:     workflows@vger.kernel.org
Subject: matrix.org as a replacement for IRC?
Date:   Tue, 14 Jan 2020 18:35:47 +0530
Message-ID: <87d0bmkx1w.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-14_03:2020-01-13,2020-01-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=631 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=1 clxscore=1011
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001140111
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


Hi all,

Was there any discussion around using matrix.org or any other
alternative as a replacement for IRC? This should help to avoid setting
up irc proxy to keep track of discussion when the users are not online.

IIUC both KDE and mozilla switched to matrix as their IRC replacement.

-aneesh
