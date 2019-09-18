Return-Path: <SRS0=PHiI=XN=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F443C4CEC9
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 19:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1877521D6C
	for <workflows@archiver.kernel.org>; Wed, 18 Sep 2019 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568836062;
	bh=f+UNOZRgw5zIecn7jbB44rdai/opweM2c+AGaGNxE10=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=b5cvIuvlLk8d6K2OD/igOjI17+f8nH9LACoJguyk0agbpnwr+OPpUzhUX21rE/nHp
	 oKvZuMKLakxs0YkHvkxNSaHQfmAx5ysePSahrXqsxUikraFOalpzqThwTve/6efVuU
	 xWzvlWRnYHduaDkYXK4LXaOPunNIhNeWpG7XWy2o=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731728AbfIRTrl (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Sep 2019 15:47:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:52706 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730805AbfIRTrl (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Sep 2019 15:47:41 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B7209207FC;
        Wed, 18 Sep 2019 19:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568836060;
        bh=f+UNOZRgw5zIecn7jbB44rdai/opweM2c+AGaGNxE10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u0k3LrAFhdD7rjrZdwUvpJN0G9YnWloX5xiCfxDild2sTVvb0RPtbKy+fgRw9Re4z
         psuaqboWMNY/QlaBujO2IdmiLBsTr4kaN7gzcrZDbI3vW53dHcs24r9ePjDoB9hWuP
         ut5VbzXTQF7tJWqAe62g5AsonpmPBz0gUqomz0g8=
Date:   Wed, 18 Sep 2019 21:47:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Philip Li <philip.li@intel.com>
Cc:     Steven Rostedt <rostedt@goodmis.org>, lkp@intel.com,
        "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        oliver.sang@intel.com
Subject: Re: Notification of your branch being tested by zero day bot?
Message-ID: <20190918194737.GA2020317@kroah.com>
References: <20190912110230.483152ed@oasis.local.home>
 <20190913044919.GB120223@kroah.com>
 <20190918073138.GA1295@intel.com>
 <20190918093822.7bc78236@gandalf.local.home>
 <20190918144618.GE9214@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918144618.GE9214@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 18, 2019 at 10:46:18PM +0800, Philip Li wrote:
> On Wed, Sep 18, 2019 at 09:38:22AM -0400, Steven Rostedt wrote:
> > On Wed, 18 Sep 2019 15:31:38 +0800
> > Philip Li <philip.li@intel.com> wrote:
> > 
> > > > On Thu, Sep 12, 2019 at 11:02:30AM -0400, Steven Rostedt wrote:  
> > > > > Would it be possible to have an opt-in for the zero day bot to send an
> > > > > email when a branch is being tested? Similar to the "SUCCESS" opt-in
> > > > > email.  
> > > do you mean something like BUILD start notification? This is good idea,
> > > we can support this.
> > 
> > That would be great.
> > 
> > > 
> > > > > 
> > > > > That is, it would be nice to see an email that lets you know that a
> > > > > branch you pushed to kernel.org is being tested. Currently there's a
> > > > > bit of limbo when a push happens, and you need to wait, perhaps several
> > > > > days, to see a result. In the mean time you have no idea if there's any
> > > > > progress going on. A notification would be nice.  
> > > > 
> > > > What is "implied" here is the fact that due to the flaky-ness of 0-day
> > > > these days, we really do not know if it is running or not.  
> > > sorry that 0day ci had issue in July time frame, but it was recovered
> > > from August to generate report continuously. We will keep monitoring the
> > > healthy status to avoid any inconvenience.
> > > 
> > 
> > Thanks.
> > 
> > > > 
> > > > Lately it seems like it is "not" running, but due to the lack of any
> > > > status, it's really hard to tell how long a maintainer should wait
> > > > before "giving up" on getting a timely response and just relying on
> > > > their own judgement.  
> > > Currently, if a repo is opt in for success notification, it will receive
> > > build incomplete if the full build test can't be done within 1 day.
> > > We will consider to enable this for all maintainer's repo.
> > 
> > Hmm, perhaps that should be opt-in as well. Not sure if every build
> > maintainer would like that notification. But we should definitely try
> > to find a way to inform those that would like to be notified. Several
> > developers have mentioned they were unaware of the SUCCESS notification
> > opt in, and would like to be added to it. Perhaps a one time email to
> > all maintainers not currently opt-in to the success notification to ask
> > them if they would like to be opted in, instead of just spamming them
> > with this information.
> thanks for the suggestion, we will consult maintainers firstly to see
> whether any maintainer wants to opt in.

I would love to opt-in for this on all of my branches, and the stable
branches/trees you build.

thanks,

greg k-h
