Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B49ECE58E
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 09:12:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 693D321835
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 09:12:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="piWcCtlt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbfJOJML (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 05:12:11 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:40642 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfJOJMK (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 05:12:10 -0400
Received: by mail-qt1-f196.google.com with SMTP id m61so29494709qte.7
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ja5wZ9zmyzjfGjfjnKfyFLAezuxYr0TgJGQFbo4joTY=;
        b=piWcCtltQHjUidQ0sTSnu3DRl0LOzlB142hMXrYeXeQ4u5Nzt53n/tyy8Ji6EEYIAy
         xKinVkGeF6W0EUR6Vk7rqH34N2f46PkHPgh2vF9nTF3jqNlU75wts/UKqe9TYNOY/FO4
         i28STUAfZ0ZPgsRAjiegQ0pma5ntWwvukEWbMrOJSw9ans1yyIg/4T4OlgduS4FTuQLK
         e7YBNyOX4T1NUwRqeNvgc3L6xCrESfjvkgeUTCriG0uSu36XjP7VeaHVirJHCR2js9S9
         ZyWwAv+eFISCeUrp3+pctl1Gu7ZAVOb2Gf9tj+NevE9nOuBP593e9a81OmQr7chnCiaG
         h5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ja5wZ9zmyzjfGjfjnKfyFLAezuxYr0TgJGQFbo4joTY=;
        b=N9O2rudkt3OUl8ACL9myCdXn1Ksz6OBVrrIHHGsM7aPCwYST7r8NXaw2gnc638I6uv
         LuL7uo+BABF9oMivCrqE9za9LgjKNhfm4HEyPa0mQlIv+OJieItdwUsbnTC2eTecBTwB
         9JzQdK/pUWh//Us9eMT5SB6c2m3SUqbHcQTfi8UKzjCp9nNm4ngBDGgLzpoIPv1aAXrw
         3f+GHEAWFmq/dI5EvE4mMNg8xISf+m0xlNCdYiEqvgKHogIE+1fm+MsspQw2CFGc1fap
         Pbhe7qNAZ+Q6G06A649CvMO9VkxUpu8CyyyoMjn7nBY0xBizmbk29+Fmpl1hONoZn7co
         Xjzw==
X-Gm-Message-State: APjAAAW8pyCJK8UR6D2fwbPcYgJwzy2uxoFCL5xNVb9wwW7Y2l/PGkOQ
        Xj8YHNytzUvorrb677q4qkb13xKFMU0I0qW3dlW1vWMspOU=
X-Google-Smtp-Source: APXvYqy7Jh979gluwYHa/OtiEmn8n3g1t86oA/GqUKCgRUIDX1heJBFnuOB9mRyiKZ/FDm401fT0lFchNxW2ywb9G8U=
X-Received: by 2002:a0c:c3c5:: with SMTP id p5mr15646355qvi.34.1571130729346;
 Tue, 15 Oct 2019 02:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191010144150.hqiosvwolm3lmzp5@chatter.i7.local>
 <20191011085702.GB1075470@kroah.com> <f41e7a81-54f4-d4e8-b3c0-d98608fc4bdc@linuxfoundation.org>
 <CACT4Y+aYn57hQ4do0jvUGm-0C02UuDSwWeZL=M6XAaZjS51Jyw@mail.gmail.com> <20191015085746.GA9401@dcvr>
In-Reply-To: <20191015085746.GA9401@dcvr>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 15 Oct 2019 11:11:57 +0200
Message-ID: <CACT4Y+Z_u-woXGyvdb6sS9_OaxptpLfg_RUg_EdknJfWdMwMSw@mail.gmail.com>
Subject: Re: RFE: use patchwork to submit a patch
To:     Eric Wong <e@80x24.org>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        patchwork@lists.ozlabs.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Tue, Oct 15, 2019 at 10:57 AM Eric Wong <e@80x24.org> wrote:
>
> Dmitry Vyukov <dvyukov@google.com> wrote:
> > As one data point, I cannot send emails with git send-email anymore.
> > It used to work, then broke and I don't know how to fix it. Now it says:
> >
> > 5.7.8 Username and Password not accepted. Learn more at
> > 5.7.8  https://support.google.com/mail/?p=BadCredentials
> > s10sm8376885wrr.5 - gsmtp
> >
> > I suspect it has something to do with two factor auth.
> > So that's it: it cannot contribute to kernel right now.
> > I will not consider time spent fixing it as useful time investment.
>
> I'm sorry you feel that way about time investments...
> But I've always assumed that's also the sentiment for time spent
> learning ANY new tools or workflow changes that come along.

This is true. But the fact that there is a learning curve to anything
does not justify any learning curve for everything. Some parts of
technology may be isolated completely and one does not need to learn
anything about that part. For example, today to compile a high-level
language one generally does not need to learn anything about machine
instructions. So the question is: is SMTP/IMAP is something that
inherently needs to be learned for contribution to kernel or it can be
hidden/not required/made simpler? And looking at github/facebook I
would assume that contributors do not have to be exposed to that.


> > Any kernel documentation that I can find for gmail, mentions config
> > that I am already using and that is not working:
> > https://www.kernel.org/doc/html/latest/search.html?q=gmail&check_keywords=yes&area=default#
> > https://www.kernel.org/doc/html/latest/process/email-clients.html?highlight=gmail
>
> Fwiw, git-send-email(1) manpage also has a special section for gmail:
>
>   https://kernel.org/pub/software/scm/git/docs/git-send-email.html
>
> and a link for app-specific passwords:
>
>   https://security.google.com/settings/security/apppasswords
>
> Perhaps that helps?

For me that page says "The setting you are looking for is not
available for your account".
I suspect app passwords work if 2-factor auth is enabled, but what
enabled on my account is "Use your phone to sign in", which is
different from 2-factor auth setting.
