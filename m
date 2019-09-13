Return-Path: <SRS0=s0xN=XI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7092FC49ED7
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 04:49:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4141B208C0
	for <workflows@archiver.kernel.org>; Fri, 13 Sep 2019 04:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568350165;
	bh=lrtg/Wv3bnZCnlypd3bsmMdtiu1cusCEVR6qrsPG1S8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=zyYsVwvv1zuIzTqYU7S++Qz1LsjGpubBDOE4wwH5MOi1c6FbPCo+y07f5/p+igivB
	 VIJ9xqotHSEHU28Va1QjF9Ps9zwi/MsWkTo2eYOcGq9yETdf9t9XmzohdmOGfg62lJ
	 BKo4P+feFYH9ZjPRXEqAA7e8XOtyalgvvGoIbL20=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfIMEtZ (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Fri, 13 Sep 2019 00:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725270AbfIMEtY (ORCPT <rfc822;workflows@vger.kernel.org>);
        Fri, 13 Sep 2019 00:49:24 -0400
Received: from localhost (unknown [84.241.200.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7529A20644;
        Fri, 13 Sep 2019 04:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568350164;
        bh=lrtg/Wv3bnZCnlypd3bsmMdtiu1cusCEVR6qrsPG1S8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TfYJ5FecPIjMyFPXYovO52o2o+/yEdA17YCCTtpzDfBsMq6jyD1tjt0K8gKAY1FgJ
         6nZU9Xi2Oc824NZA1xP2HAx9Oknb79IxETsR24N0L/Nd4VaNeYDI+nBAJoAy5w6+1J
         iPqT+hVnOMJ7QYhUf2yngjdceNx41hCGAxgG5yCo=
Date:   Fri, 13 Sep 2019 05:49:19 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Steven Rostedt <rostedt@goodmis.org>, lkp@intel.com
Cc:     "workflows@vger.kernel.org" <workflows@vger.kernel.org>
Subject: Re: Notification of your branch being tested by zero day bot?
Message-ID: <20190913044919.GB120223@kroah.com>
References: <20190912110230.483152ed@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912110230.483152ed@oasis.local.home>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

(adding lkp@intel.com so that hopefully the right people see this)

On Thu, Sep 12, 2019 at 11:02:30AM -0400, Steven Rostedt wrote:
> Would it be possible to have an opt-in for the zero day bot to send an
> email when a branch is being tested? Similar to the "SUCCESS" opt-in
> email.
> 
> That is, it would be nice to see an email that lets you know that a
> branch you pushed to kernel.org is being tested. Currently there's a
> bit of limbo when a push happens, and you need to wait, perhaps several
> days, to see a result. In the mean time you have no idea if there's any
> progress going on. A notification would be nice.

What is "implied" here is the fact that due to the flaky-ness of 0-day
these days, we really do not know if it is running or not.

Lately it seems like it is "not" running, but due to the lack of any
status, it's really hard to tell how long a maintainer should wait
before "giving up" on getting a timely response and just relying on
their own judgement.

thanks,

greg k-h
