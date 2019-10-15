Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FE3C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7D91A218DE
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 16:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VIpffs3Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbfJOQYT (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 12:24:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56706 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbfJOQYS (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 12:24:18 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E476C324;
        Tue, 15 Oct 2019 18:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571156657;
        bh=SP4PolCNQGz+iSmJK7smUunVvDDFJDycgJ7at+oVip4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VIpffs3Ykq4TyI1KJLgL+M8JQ98FHeb4jUCG7ZaoAoPpVzlT5WK1KffScSY8YMixy
         6fkKGyLdGlvsKOY7tMjGOq2zt5UGZ5L35ukfg5K/nt3+Wi98JKEUbxPjJJpwosaI2P
         nGHaft9Ad9p/x05XX/P6wslJJBzZZ/WMlg+0lPGo=
Date:   Tue, 15 Oct 2019 19:24:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Eric Wong <e@80x24.org>, Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015162413.GF4875@pendragon.ideasonboard.com>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
 <20191015085746.GA9401@dcvr>
 <CACT4Y+Z_u-woXGyvdb6sS9_OaxptpLfg_RUg_EdknJfWdMwMSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+Z_u-woXGyvdb6sS9_OaxptpLfg_RUg_EdknJfWdMwMSw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 11:11:57AM +0200, Dmitry Vyukov wrote:
> On Tue, Oct 15, 2019 at 10:57 AM Eric Wong wrote:
> > Dmitry Vyukov wrote:
> >> As one data point, I cannot send emails with git send-email anymore.
> >> It used to work, then broke and I don't know how to fix it. Now it says:
> >>
> >> 5.7.8 Username and Password not accepted. Learn more at
> >> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> >> s10sm8376885wrr.5 - gsmtp
> >>
> >> I suspect it has something to do with two factor auth.
> >> So that's it: it cannot contribute to kernel right now.
> >> I will not consider time spent fixing it as useful time investment.
> >
> > I'm sorry you feel that way about time investments...
> > But I've always assumed that's also the sentiment for time spent
> > learning ANY new tools or workflow changes that come along.
> 
> This is true. But the fact that there is a learning curve to anything
> does not justify any learning curve for everything. Some parts of
> technology may be isolated completely and one does not need to learn
> anything about that part. For example, today to compile a high-level
> language one generally does not need to learn anything about machine
> instructions.

That's only true to some extent. Yes, you can develop in java without
knowing what a CPU is, but to develop efficient and safe software, a
knowledge of the whole stack is very useful, when not required.

> So the question is: is SMTP/IMAP is something that
> inherently needs to be learned for contribution to kernel or it can be
> hidden/not required/made simpler? And looking at github/facebook I
> would assume that contributors do not have to be exposed to that.

Could we develop a patch submission and review based on facebook if we
wanted to ? Most likely yes. Would we consider that as a good idea ?
Most likely no. There are always pros and cons in any workflow, and
while I could personally move away from e-mail, I would want a solution
that brings me most of the benefits of e-mail, in particular
decentralisation. git**b creates both a central point of failure and a
central point of trust, so it's a big no-go as far as I'm concerned. On
the other hand, creating a solution that enables optional use of forges
for contributors would prefer using them doesn't bother me at all, quite
the contrary.

> >> Any kernel documentation that I can find for gmail, mentions config
> >> that I am already using and that is not working:
> >> https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> >> https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
> >
> > Fwiw, git-send-email(1) manpage also has a special section for gmail:
> >
> >   https://kernel.org/pub/software/scm/git/docs/git-send-email.html
> >
> > and a link for app-specific passwords:
> >
> >   https://security.google.com/settings/security/apppasswords
> >
> > Perhaps that helps?
> 
> For me that page says "The setting you are looking for is not
> available for your account".
> I suspect app passwords work if 2-factor auth is enabled, but what
> enabled on my account is "Use your phone to sign in", which is
> different from 2-factor auth setting.

Did git-send-email start failing when enabling phone as a mean to sign
in, or was it unrelated ?

-- 
Regards,

Laurent Pinchart
