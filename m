Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5518CC10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:08:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1D9C420873
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571155699;
	bh=vbrvjZz1tjiO5p0aTRT3Eu9xUbT6EuAPesEJcjl0oUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EGxzlt3I6pNhyv6mNG0L2Va6HFC1RrNTQPdFMcBNU4HGkGdba7Egc+01gbzhf/Qn0
	 +6QyYJM7QFRU9hhStZh1Z7MOsGVuNo/V/536WnXB+Dz1asDRjapjF6YIu/3DGdRlUZ
	 0T9jM/PyZ/GHQw0AtvNOjUgrSM9OArvEOsUPCOpo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbfJOQIS (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:08:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726333AbfJOQIS (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 12:08:18 -0400
Received: from localhost (unknown [38.98.37.135])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0ABF120872;
        Tue, 15 Oct 2019 16:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571155697;
        bh=vbrvjZz1tjiO5p0aTRT3Eu9xUbT6EuAPesEJcjl0oUc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y3BwcOa0jJRAoZoLpjUQgohsR0BhuMXtIv5VVEY7jSdb94K7m9T0MrcpP1Ub12GD7
         Jp0XnFa2tZB2kfeqIgs7ifXCsvAgV1p0KPRP/Ox72dGnry9veWWm8GoDpXqzZK1cY/
         hyqb6peqPOIX7xQR/U3qFWKcQzVCIGw0jTDgSOus=
Date:   Tue, 15 Oct 2019 18:07:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>, patchwork@lists.ozlabs.org,
        workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015160753.GE1003139@kroah.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191014151711.GA654561@kroah.com>
 <CACT4Y+ZjUz1X3eE9NT=X8CX3ZBNMZn21AMmSPbNfybTYK4BYAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+ZjUz1X3eE9NT=X8CX3ZBNMZn21AMmSPbNfybTYK4BYAw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 06:41:03AM +0200, Dmitry Vyukov wrote:
> On Mon, Oct 14, 2019 at 5:17 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > As one data point, I cannot send emails with git send-email anymore.
> > > It used to work, then broke and I don't know how to fix it. Now it says:
> > >
> > > 5.7.8 Username and Password not accepted. Learn more at
> > > 5.7.8  https://support.google.com/mail/?p=BadCredentials
> > > s10sm8376885wrr.5 - gsmtp
> > >
> > > I suspect it has something to do with two factor auth.
> > > So that's it: it cannot contribute to kernel right now.
> >
> > That is because your employer changed how it manages imap.  So yes, this
> > configuration is now broken, you can not contribute to the kernel this
> > way.  They know about it, and there's an "opt-out" list you can sign up
> > for if you want to fix it.  Nothing the community can do about something
> > crazy like this.
> 
> I used my private gmail account to send emails. My private email
> account stopped working.

I think you need a better email provider :)
