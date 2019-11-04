Return-Path: <SRS0=lUaU=Y4=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D4CA9EB5
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA248205C9
	for <workflows@archiver.kernel.org>; Mon,  4 Nov 2019 13:43:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="ffTNJsnA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbfKDNnA (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 4 Nov 2019 08:43:00 -0500
Received: from mail.cmpwn.com ([45.56.77.53]:39392 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727332AbfKDNnA (ORCPT <rfc822;workflows@vger.kernel.org>);
        Mon, 4 Nov 2019 08:43:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1572874980; bh=eESWshySikq5verfPCAjySgbYbnKQfaGRjpQmcPDSoE=;
        h=In-Reply-To:Date:Cc:Subject:From:To;
        b=ffTNJsnA7XR5h4H2HWEx+Z0kYtwsOaUO39aRTZIhQSSmKgnQCSZbT+kjY8Q1yIEkh
         OCcDalx3UEunLDwc+3GYZy9wJYyYOl4/Djh1K56zLd3WSDk47nh0Y4jouyYg8D9yPX
         1FGSzIpR8bg92kqlh53YmgKgqtYj9QHxvJf95e90=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20191104134206.GA2133491@kroah.com>
Date:   Mon, 04 Nov 2019 08:42:59 -0500
Cc:     "Eric Wong" <e@80x24.org>, <workflows@vger.kernel.org>
Subject: Re: patch attachments still unwelcome?
From:   "Drew DeVault" <sir@cmpwn.com>
To:     "Greg KH" <gregkh@linuxfoundation.org>,
        "Theodore Y. Ts'o" <tytso@mit.edu>
Message-Id: <BY75NACT4RE6.3FMUPXJYHLVZK@homura>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Also pitching in with a vote against patches-as-attachments. My mailing
list software doesn't know how to deal with these and I don't really
want to teach it about them.
