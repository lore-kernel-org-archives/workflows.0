Return-Path: <SRS0=9qbL=YC=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF98FC47404
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:19:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B23D6218AC
	for <workflows@archiver.kernel.org>; Wed,  9 Oct 2019 22:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qeGmxHkx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfJIWTv (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 9 Oct 2019 18:19:51 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:33994 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730809AbfJIWTv (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 9 Oct 2019 18:19:51 -0400
Received: by mail-lf1-f46.google.com with SMTP id r22so2840995lfm.1
        for <workflows@vger.kernel.org>; Wed, 09 Oct 2019 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6h6OhP36MJCgt2nSOIe3gxizFMtbFC9+kBnUPJ3vGeo=;
        b=qeGmxHkxuufzG7UFeB4rFx9hecDmxG8Chl0hL4bN5xsIzSVJy125SqQm5BISwhQWlz
         F4Dup6GmTbeN1BvQeuUcz9qjTHvHMo8Qcgu/h8kXXjWtY7cOWYp0W1Jiqs8sIbY9+78L
         ipJARB4cdzaZ2b8IaKFNXgEg4cpBrdwa2ZYZPnEMbNJw4FeAtavs+KOAIU6apjdsnTdm
         M2H4EnfS3LvaY8SCYp+Bc9SDcWpUkIlI6U+e53v3Na23y21P4Y7BoQ7fIb5AcDS6ugzq
         bu4MoOwGZIB7sxETCB8cuG2pahgZBqnggpmaf64IkPOAGgUk1fv1Iv97anJaOOH55QrM
         KQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6h6OhP36MJCgt2nSOIe3gxizFMtbFC9+kBnUPJ3vGeo=;
        b=ZAWOiKwMaKdTQYziXksPnnlklEPJR6DtzTy4girp5fj1ZoNbaa9H+eCBunfD45iRkT
         6Z+PLxkjpNtfDqLx4A2X2eukgJLmBKtgqoAANoVII6guByeHvHrMbimFK9l+6QvukRyd
         XgDH7NnjQC+F5k3FkZu9R5wubJkLQlnH2tBkLJVpXw6nJ0yC6SAvyKbbAtYPnWJ46g3w
         J8r9o42r76oPZTVwnSl0iyYhqJcs+3MyJTcmYutTADYV+NVAvBE8VZwifJ4I5nfD2wfc
         ErGeOqCX5Mc/1kIAuzmcBswFAVmzS0iHIkPwUTj2TPU3RjsPnNsAB9p3oDijUDvBb6ub
         8Zvg==
X-Gm-Message-State: APjAAAVEsTw1JWIEoKqjMCq5V/DY7XmDQifupmJMQLfZeDZ/0gIjZtAn
        T5iZakSGqofVjfEkKE+iTo4gqOfqq86jRe+/tuMnNQ==
X-Google-Smtp-Source: APXvYqzbOiIavJ961j4B+LgO6bW71FnixMm8veavh9Iq5PG4DuSTSfdmK+dyZ9yCCb83s5NwA8LgjN3sqMbo7bGJHfU=
X-Received: by 2002:a05:6512:285:: with SMTP id j5mr3370007lfp.98.1570659588231;
 Wed, 09 Oct 2019 15:19:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190924182536.GC6041@hmswarspite.think-freely.org>
 <BX8G8FACJ68D.3RNYA1J9VP98Z@homura> <20191007.173329.2182256975398971437.davem@davemloft.net>
 <87zhicqhzg.fsf@dja-thinkpad.axtens.net> <20191007211704.6b555bb1@oasis.local.home>
 <20191008164309.mddbouqmbqipx2sx@redhat.com> <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com> <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com> <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <68faa5ef-6092-ea5f-191c-4b7713cb6ab2@redhat.com>
In-Reply-To: <68faa5ef-6092-ea5f-191c-4b7713cb6ab2@redhat.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Thu, 10 Oct 2019 08:19:36 +1000
Message-ID: <CAPM=9twF-19Nhh5NmkyK_S--HsnVBt=jWMQ7EF5Jd8kLOZ87EQ@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Laura Abbott <labbott@redhat.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Don Zickus <dzickus@redhat.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Axtens <dja@axtens.net>,
        David Miller <davem@davemloft.net>,
        Drew DeVault <sir@cmpwn.com>,
        Neil Horman <nhorman@tuxdriver.com>, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org

On Thu, 10 Oct 2019 at 08:09, Laura Abbott <labbott@redhat.com> wrote:
>
> On 10/9/19 5:54 PM, Konstantin Ryabitsev wrote:
> > On Wed, Oct 09, 2019 at 05:35:39PM -0400, Laura Abbott wrote:
> >>> This doesn't mean that forges are entirely out -- but they must remai=
n mere tools that participate in a globally decentralized, developer-attest=
able, self-archiving messaging service. Maybe let's call that "kernel devel=
oper bus" or "kdbus" -- pretty sure that name hasn't been used before.
> >>>
> >>
> >> The big issue I see with anything decentralized is that as things
> >> grow people don't actually want to host their own infrastructure.
> >> Think about the decline in the number of people who host their own
> >> e-mail server. Anything decentralized would still presumably require
> >> a server somewhere, so you're going to either raising the bar to entry
> >> by requiring people to set up their own server or end up with people
> >> still relying on a service somewhere. This feels like it ends up with
> >> the situation we have today where most things are locally optimized
> >> but on average the situation is still lousy.
> >>
> >> You've articulated you've articulated the reasons against centralizati=
on
> >> very well from an admin point of view (which I won't dispute) but at
> >> least from a user point of view a centralized forge infrastructure is
> >> great because I don't have to worry about it. My university/company
> >> doesn't have to set anything up for me to contribute. I get we are
> >> probably going to end up optimizing more for the maintainer here but
> >> it's worth thinking about how we could get forge-like benefits where
> >> most users don't have to run infrastructure.
> >
> > We're actually not in opposition to each-other -- I expect kernel.org
> > (via Linux Foundation) would provide convenient bridge tools to cover t=
he precise concern you mention. Think kind of like patchwork.kernel.org, bu=
t instead of exclusively using some local database that only admins at kern=
el.org have access to, it would provide a set of feeds allowing anyone else=
 to set up a fully functioning replica -- or participate in the process usi=
ng their own compatible tools.
> >
> > So, in other words, the forge is still there and is still providing a v=
aluable service, but it is not the single point of truth that can vanish an=
d take invaluable data with it. That's my vision, and I think we have all w=
e need to achieve it short of resolve, buy-in, and proper tooling.
> >
>
> I'll admit I'm skeptical about the "participate with their own tools"
> bit, simply because you end up with too many sides arguing about
> standards and either n buggy implementations or effectively a single
> implementation anyway.

I'm with Laura, at the point where you have to write a fully qualified
spec just so few people can keep their own workflows I feel you've
taken things too far.

Dave.
