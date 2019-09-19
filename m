Return-Path: <SRS0=zdxt=XO=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FE5C49ED7
	for <workflows@archiver.kernel.org>; Thu, 19 Sep 2019 03:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B68A020644
	for <workflows@archiver.kernel.org>; Thu, 19 Sep 2019 03:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbfISDQD (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 18 Sep 2019 23:16:03 -0400
Received: from mga07.intel.com ([134.134.136.100]:47101 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727165AbfISDQD (ORCPT <rfc822;workflows@vger.kernel.org>);
        Wed, 18 Sep 2019 23:16:03 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Sep 2019 20:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,522,1559545200"; 
   d="scan'208";a="186668725"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.13.128])
  by fmsmga008.fm.intel.com with ESMTP; 18 Sep 2019 20:16:00 -0700
Date:   Thu, 19 Sep 2019 11:21:01 +0800
From:   Philip Li <philip.li@intel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>, lkp@intel.com,
        "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
        oliver.sang@intel.com
Subject: Re: Notification of your branch being tested by zero day bot?
Message-ID: <20190919032100.GC7453@intel.com>
References: <20190912110230.483152ed@oasis.local.home>
 <20190913044919.GB120223@kroah.com>
 <20190918073138.GA1295@intel.com>
 <20190918093822.7bc78236@gandalf.local.home>
 <20190918144618.GE9214@intel.com>
 <20190918194737.GA2020317@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918194737.GA2020317@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Sep 18, 2019 at 09:47:37PM +0200, Greg KH wrote:
> On Wed, Sep 18, 2019 at 10:46:18PM +0800, Philip Li wrote:
> > On Wed, Sep 18, 2019 at 09:38:22AM -0400, Steven Rostedt wrote:
> > > On Wed, 18 Sep 2019 15:31:38 +0800
> > > Philip Li <philip.li@intel.com> wrote:
> > > 
> > > > > On Thu, Sep 12, 2019 at 11:02:30AM -0400, Steven Rostedt wrote:  
> > > > > > Would it be possible to have an opt-in for the zero day bot to send an
> > > > > > email when a branch is being tested? Similar to the "SUCCESS" opt-in
> > > > > > email.  
> > > > do you mean something like BUILD start notification? This is good idea,
> > > > we can support this.
> > > 
> > > That would be great.
> > > 
> > > > 
> > > > > > 
> > > > > > That is, it would be nice to see an email that lets you know that a
> > > > > > branch you pushed to kernel.org is being tested. Currently there's a
> > > > > > bit of limbo when a push happens, and you need to wait, perhaps several
> > > > > > days, to see a result. In the mean time you have no idea if there's any
> > > > > > progress going on. A notification would be nice.  
> > > > > 
> > > > > What is "implied" here is the fact that due to the flaky-ness of 0-day
> > > > > these days, we really do not know if it is running or not.  
> > > > sorry that 0day ci had issue in July time frame, but it was recovered
> > > > from August to generate report continuously. We will keep monitoring the
> > > > healthy status to avoid any inconvenience.
> > > > 
> > > 
> > > Thanks.
> > > 
> > > > > 
> > > > > Lately it seems like it is "not" running, but due to the lack of any
> > > > > status, it's really hard to tell how long a maintainer should wait
> > > > > before "giving up" on getting a timely response and just relying on
> > > > > their own judgement.  
> > > > Currently, if a repo is opt in for success notification, it will receive
> > > > build incomplete if the full build test can't be done within 1 day.
> > > > We will consider to enable this for all maintainer's repo.
> > > 
> > > Hmm, perhaps that should be opt-in as well. Not sure if every build
> > > maintainer would like that notification. But we should definitely try
> > > to find a way to inform those that would like to be notified. Several
> > > developers have mentioned they were unaware of the SUCCESS notification
> > > opt in, and would like to be added to it. Perhaps a one time email to
> > > all maintainers not currently opt-in to the success notification to ask
> > > them if they would like to be opted in, instead of just spamming them
> > > with this information.
> > thanks for the suggestion, we will consult maintainers firstly to see
> > whether any maintainer wants to opt in.
> 
> I would love to opt-in for this on all of my branches, and the stable
> branches/trees you build.
got it Greg, i had added notifications for 3 more repos for you which
were missed before.

> 
> thanks,
> 
> greg k-h
