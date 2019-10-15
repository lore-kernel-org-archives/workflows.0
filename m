Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60977C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 08:57:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 302BB2089C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 08:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727582AbfJOI5r (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 04:57:47 -0400
Received: from dcvr.yhbt.net ([64.71.152.64]:45574 "EHLO dcvr.yhbt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727444AbfJOI5q (ORCPT <rfc822;workflows@vger.kernel.org>);
        Tue, 15 Oct 2019 04:57:46 -0400
Received: from localhost (dcvr.yhbt.net [127.0.0.1])
        by dcvr.yhbt.net (Postfix) with ESMTP id 6EA1B1F4C0;
        Tue, 15 Oct 2019 08:57:46 +0000 (UTC)
Date:   Tue, 15 Oct 2019 08:57:46 +0000
From:   Eric Wong <e@80x24.org>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Subject: Re: RFE: use patchwork to submit a patch
Message-ID: <20191015085746.GA9401@dcvr>
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com>
 <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com>
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> wrote:
> As one data point, I cannot send emails with git send-email anymore.
> It used to work, then broke and I don't know how to fix it. Now it says:
> 
> 5.7.8 Username and Password not accepted. Learn more at
> 5.7.8  https://support.google.com/mail/?p=BadCredentials
> s10sm8376885wrr.5 - gsmtp
> 
> I suspect it has something to do with two factor auth.
> So that's it: it cannot contribute to kernel right now.
> I will not consider time spent fixing it as useful time investment.

I'm sorry you feel that way about time investments...
But I've always assumed that's also the sentiment for time spent
learning ANY new tools or workflow changes that come along.

> Any kernel documentation that I can find for gmail, mentions config
> that I am already using and that is not working:
> https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail

Fwiw, git-send-email(1) manpage also has a special section for gmail:

  https://kernel.org/pub/software/scm/git/docs/git-send-email.html

and a link for app-specific passwords:

  https://security.google.com/settings/security/apppasswords

Perhaps that helps?
