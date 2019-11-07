Return-Path: <SRS0=i0oo=Y7=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2141EC5DF60
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:41:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D3E562178F
	for <workflows@archiver.kernel.org>; Thu,  7 Nov 2019 10:40:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axtens.net header.i=@axtens.net header.b="LSQX4wOd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733142AbfKGKk7 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 7 Nov 2019 05:40:59 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38627 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfKGKk7 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 7 Nov 2019 05:40:59 -0500
Received: by mail-pg1-f195.google.com with SMTP id 15so1926250pgh.5
        for <workflows@vger.kernel.org>; Thu, 07 Nov 2019 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=axtens.net; s=google;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=uQXSm1WV6LRBQm25dfaiSt6pW9vwBfKbRhR+H3c+wdA=;
        b=LSQX4wOdUUZAcVX2Uv/aU5QzTmRMdc5Bay9e4MgFPvbpCdm/1SiyVTbI1TBDrLqFkV
         CMmON1Kln4TyOQZdkMrkzdTGirm8Xhs45l/mE/fNaNAYaFkrQcw5EyIKusnHcv/obSqa
         7bAKf48PpisAQUcFIYhDNAlQUraUhs8yoCNw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=uQXSm1WV6LRBQm25dfaiSt6pW9vwBfKbRhR+H3c+wdA=;
        b=e1P41n4wlJJZsxvoPFbSQ/picR9HdqORV4yxUmLZpSiJzsH2ey0r/epzkw6IgP5S8V
         lFADYOrhj39tMdEx5qGA9eEFlfCL3JeQXJdUy7ZGm/SkowxI3F++wX6SpPLYLZdcN6OK
         4ahrw7+o619ITZHsThgcFZBjka8fJvTGUPXAF2hBt5QmHsmbnEScGjJujAm/2AJ0SMxL
         nB1URpOzdaIrPgWX3LSJ9mwkiT7EKJws0d21BglDRd1GhCdS0uBOxD+atHTvGXjxdsD0
         oSMXetOkMZJzzSiRuMJy9p5phUr1COfCq82e6cz6lxq7dj15/n7iUbj06AYTYG6gbLfU
         2dRQ==
X-Gm-Message-State: APjAAAWAbUd9Ceh08ZDpRui3a9gNJv5u8Y1AZxylFvnzZPNKPrU3FXHa
        3OEdXx/H/wq9wei/wwbmM+4OOw==
X-Google-Smtp-Source: APXvYqw4NFYcxkefy8LhreJ5ss9cMOZPcX46xa6ZBFUeYAzONYsZdo8WZdE4nfsXyOr14yy/JHEgLg==
X-Received: by 2002:a62:1693:: with SMTP id 141mr3179340pfw.146.1573123256841;
        Thu, 07 Nov 2019 02:40:56 -0800 (PST)
Received: from localhost (2001-44b8-1113-6700-40d3-eca3-e70b-6bc4.static.ipv6.internode.on.net. [2001:44b8:1113:6700:40d3:eca3:e70b:6bc4])
        by smtp.gmail.com with ESMTPSA id j4sm2181438pfh.187.2019.11.07.02.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 02:40:55 -0800 (PST)
From:   Daniel Axtens <dja@axtens.net>
To:     Dmitry Vyukov <dvyukov@google.com>
Cc:     workflows@vger.kernel.org, automated-testing@yoctoproject.org,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Han-Wen Nienhuys <hanwen@google.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Veronika Kabatova <vkabatov@redhat.com>
Subject: Re: Structured feeds
In-Reply-To: <CACT4Y+Z2PJ=L+5_a=tmxkTLz7puGh4Yx0+uPPk999p-S4Zmi_A@mail.gmail.com>
References: <CACT4Y+YSC5zkJNy2U7YyZM_FV2XO1aFQDjoUgm5ifAUNxvYu9g@mail.gmail.com> <8736f1hvbn.fsf@dja-thinkpad.axtens.net> <CACT4Y+Z2PJ=L+5_a=tmxkTLz7puGh4Yx0+uPPk999p-S4Zmi_A@mail.gmail.com>
Date:   Thu, 07 Nov 2019 21:40:52 +1100
Message-ID: <87woccgea3.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

Dmitry Vyukov <dvyukov@google.com> writes:

> On Wed, Nov 6, 2019 at 4:35 PM Daniel Axtens <dja@axtens.net> wrote:
>>
>> > As soon as we have a bridge from plain-text emails into the structured
>> > form, we can start building everything else in the structured world.
>> > Such bridge needs to parse new incoming emails, try to make sense out
>> > of them (new patch, new patch version, comment, etc) and then push the
>> > information in structured form. Then e.g. CIs can fetch info about
>>
>> This is an non-trivial problem, fwiw. Patchwork's email parser clocks in
>> at almost thirteen hundred lines, and that's with the benefit of the
>> Python standard library. It also regularly gets patched to handle
>> changes to email systems (e.g. DMARC), changes to git (git request-pull
>> format changed subtly in 2.14.3), the bizzare ways people send email,
>> and so on.
>>
>> Patchwork does expose much of this as an API, for example for patches:
>> https://patchwork.ozlabs.org/api/patches/?order=-id so if you want to
>> build on that feel free. We can possibly add data to the API if that
>> would be helpful. (Patches are always welcome too, if you don't want to
>> wait an indeterminate amount of time.)
>
> Hi Daniel,
>
> Thanks!
> Could you provide a link to the code?
> Do you have a test suite for the parser (set of email samples and what
> they should be parsed to)?

Sure:
https://github.com/getpatchwork/patchwork in particular
https://github.com/getpatchwork/patchwork/blob/master/patchwork/parser.py and
https://github.com/getpatchwork/patchwork/tree/master/patchwork/tests

Regards,
Daniel
