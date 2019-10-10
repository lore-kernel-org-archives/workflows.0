Return-Path: <SRS0=yuFl=YD=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E96CC10F14
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 17:53:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0835421835
	for <workflows@archiver.kernel.org>; Thu, 10 Oct 2019 17:53:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r1xdGA0I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfJJRxE (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 10 Oct 2019 13:53:04 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43129 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfJJRxE (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 10 Oct 2019 13:53:04 -0400
Received: by mail-qt1-f194.google.com with SMTP id t20so4597542qtr.10
        for <workflows@vger.kernel.org>; Thu, 10 Oct 2019 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VrjWD7MIu5mEiURoaeN+u2v6srQ5LFD2f3Gsx381An8=;
        b=r1xdGA0IrM9P5BjNHT35G00ZRw/JX2ydXuBqyZFTSLyYLYcsindo1HJYpl5CR8XzQJ
         rZ1pWfISTrFh/Y9ARfThTcYlF51/RT1aP87h7qQpF2MFAb2xtdiUSymcjz9VuspZy3uY
         9bTfeoh6kH5MTBifIXnSdT6rKtr1lUOKBKo4XntceqU6tTVcWKgke0zCkFAQYvR6LPnI
         RtoO2HLIElnEH6estDm89ewkBak2apHhLP81cyPYFrA5b4+6SxYVzN/TkULeDceIaFcY
         T7QE3hI3Z+01ksbzwe+FVuUImDRdhiI5bhEAyZtxiBQbKpl4cLL51oqGaC56ZPWd5RNw
         Vsjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VrjWD7MIu5mEiURoaeN+u2v6srQ5LFD2f3Gsx381An8=;
        b=keR+WK2dhU9jDJ/CkIZkQekUUPhQCLJp1QYr0hTy4b6veScZ40tO1tj+odxPWpQn63
         GydjvNLhfGDWPgDMyK3+sMKXfeG+noDqqn2JPRhhYCbRZZyoCOhvuL1nWOiF5x/h5Fmy
         kdCEcoEFX9Smh6pgyG8OcMkNJfTi3D9LHG7hkW2cVf6q+bgG6NMWm7N4vLkrPUXvXc8D
         dKSykVdJT9VT9nP9tBhZheeucetSHu89D8XYmqIkUSW0LgN2BKp/MHCZfp1TWWAyFro2
         rdMz5rZN9+O24uYk8XgqOeWcNI7KU4/rBu/oig8rjo7YGcZPpjmPmTUn8yxEW2ZWbC6p
         1J2g==
X-Gm-Message-State: APjAAAXMsrC3jxePIgtIbwoOWuWXmVqvE9rOnIsY0DkTIIUJ3yUcwTnE
        Q9Rgg2gRAfIoFjOVMMXrxPxsp2maNCIM7rbD+iWBmA==
X-Google-Smtp-Source: APXvYqycKbsDA8EJTEEWm8HcT+mEutYzX1T1REoqpQcHRD0V2DnuMFnLn/B9eBojn65h+yd4uHpPv+DSEtnZKy36SjQ=
X-Received: by 2002:a0c:e2c9:: with SMTP id t9mr11222289qvl.22.1570729982764;
 Thu, 10 Oct 2019 10:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
In-Reply-To: <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 10 Oct 2019 19:52:50 +0200
Message-ID: <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Laura Abbott <labbott@redhat.com>, Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Wed, Oct 9, 2019 at 11:54 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Oct 09, 2019 at 05:35:39PM -0400, Laura Abbott wrote:
> >>This doesn't mean that forges are entirely out -- but they must remain
> >>mere tools that participate in a globally decentralized,
> >>developer-attestable, self-archiving messaging service. Maybe let's
> >>call that "kernel developer bus" or "kdbus" -- pretty sure that name
> >>hasn't been used before.
> >>
> >
> >The big issue I see with anything decentralized is that as things
> >grow people don't actually want to host their own infrastructure.
> >Think about the decline in the number of people who host their own
> >e-mail server. Anything decentralized would still presumably require
> >a server somewhere, so you're going to either raising the bar to entry
> >by requiring people to set up their own server or end up with people
> >still relying on a service somewhere. This feels like it ends up with
> >the situation we have today where most things are locally optimized
> >but on average the situation is still lousy.
> >
> >You've articulated you've articulated the reasons against centralization
> >very well from an admin point of view (which I won't dispute) but at
> >least from a user point of view a centralized forge infrastructure is
> >great because I don't have to worry about it. My university/company
> >doesn't have to set anything up for me to contribute. I get we are
> >probably going to end up optimizing more for the maintainer here but
> >it's worth thinking about how we could get forge-like benefits where
> >most users don't have to run infrastructure.
>
> We're actually not in opposition to each-other -- I expect kernel.org
> (via Linux Foundation) would provide convenient bridge tools to cover
> the precise concern you mention. Think kind of like
> patchwork.kernel.org, but instead of exclusively using some local
> database that only admins at kernel.org have access to, it would provide
> a set of feeds allowing anyone else to set up a fully functioning
> replica -- or participate in the process using their own compatible
> tools.
>
> So, in other words, the forge is still there and is still providing a
> valuable service, but it is not the single point of truth that can
> vanish and take invaluable data with it. That's my vision, and I think
> we have all we need to achieve it short of resolve, buy-in, and proper
> tooling.

I know you all love Gerrit but just to clarify :)
Gerrit stores all metadata in a git repo, all users can have a replica
and you can always have, say, a "backup" replica on a side done
automatically. Patches and versions of the patches are committed into
git into special branches (e.g. change/XXX/version/YYY), comments and
metadata are in a pretty straightforward json (this is comment text
for line X, etc) also committed into git, so one can always read that
in and transform into any other format. And you can also run Gerrit
locally over your replica.
So it seems that such solution would satisfy most of your
requirements, right? Namely, it does expose all of the underlying raw
data in a reasonable format.
