Return-Path: <SRS0=qIWo=YJ=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD032FA372A
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 18:34:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DBB421D7A
	for <workflows@archiver.kernel.org>; Wed, 16 Oct 2019 18:34:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PFzp4d50"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfJPSeN (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Wed, 16 Oct 2019 14:34:13 -0400
Received: from mail-vk1-f178.google.com ([209.85.221.178]:40015 "EHLO
        mail-vk1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfJPSeN (ORCPT
        <rfc822;workflows@vger.kernel.org>); Wed, 16 Oct 2019 14:34:13 -0400
Received: by mail-vk1-f178.google.com with SMTP id d126so5409572vkf.7
        for <workflows@vger.kernel.org>; Wed, 16 Oct 2019 11:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lum1oabecwQuhw4OwRKPvgTl6xpMImxCfKJN4wYtwuo=;
        b=PFzp4d50qEQL2N+EFSGg++Uexh86YBabn6TqlqDGvs+M0LZagjtT2WqPLpExH4TIwI
         AvKlGwpXnN65+c0IYvflwP83M+NWgXZquhKxlMNh3lP0e83IdNXsBv7WO2eZmRDE9O2p
         9/Apt9S76gpaRZrwYsgkJ6JyLgXVrdbSK/ivjJ9kcLKFl1TUd9OoD/oF0sFZnATXdkTc
         AhT+wFH7m6ecJ63YWW4fSRfjR01pumkrxbVPmxTtDVDcvuKV/v2SvqxxlPC1LvU0fCnj
         KWuP8pd426u2VjT9yk3KQQu38ah5JA0hdX0kubD0zRBzoGTnNiTIUTcp4/mCxqyXuVbB
         81Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lum1oabecwQuhw4OwRKPvgTl6xpMImxCfKJN4wYtwuo=;
        b=FmAYvxjFJFbplxu2r14jEnmYnKAa6JJYiXtWnlb0eFVIsFK3FcB8bxnR+ynJavwTvP
         wdObbc3fMo1nbUVYEblhg1njgyR4drG3AyeNGUc069V6lMcVMfY4q6d6zsIyPqw1/7AH
         WP0Q6sgg/pYYbxt7IY4Tupgg2cdePp3bYhOce+AIxeTWZo/L4jDOnEl263KStKb7+49N
         lO21eLWFr8cpnq8BgznAhhKb9fjPDhn+K9zW+A+lv6e0HEHQ0TVdxNqPtfIxf+uIim5o
         3U9bMhzlokUDfWVyc54bImKy99tQ8sLlJH/qIFywnRt1F+R/eZia0tRTA24ASeTAHmt5
         rxfw==
X-Gm-Message-State: APjAAAUrTgK6lEPqPoF8FsQoyFpZps6MjGql27rhkomLFmd9UOhNQ/p0
        4BcKIWPusRvUc4ocFEXmrPng9LgHW9sFST3v7e3u6w==
X-Google-Smtp-Source: APXvYqwzj20HQpuvJd156ejhBuPNnEN9gIUyzGipepp7PHPTijGV6COJTjugQij9o/8ie9eCHM37zvzEZDev7LOX9ME=
X-Received: by 2002:a05:6122:10d4:: with SMTP id l20mr22835392vko.18.1571250849311;
 Wed, 16 Oct 2019 11:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015183752.GB5473@chatter.i7.local> <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
 <20191015194103.GA23517@chatter.i7.local>
In-Reply-To: <20191015194103.GA23517@chatter.i7.local>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Wed, 16 Oct 2019 20:33:55 +0200
Message-ID: <CAFQ2z_N-_k6=QkO05de6XdBsuZsKbReF_kiET=RNTze_duKFdA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Laura Abbott <labbott@redhat.com>,
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

On Tue, Oct 15, 2019 at 9:41 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> >> 1. A gerrit instance would introduce a single source of failure, which
> >>    is something many see as undesirable. If there's a DoS attack, Goog=
le
> >>    can restrict access to their Gerrit server to limit the requests to
> >>    only come from their corporate IP ranges, but kernel.org cannot do
> >>    the same, so anyone relying on gerrit.kernel.org cannot do any work
> >>    while it is unavailable.
> >
> >I don't understand your scenario. Are you concerned that Google would
> >protect DoS attacks by limiting traffic to the corp network?
> >
> >Or are you concerned that kernel.org has no DoS protection?
>
> Kernel.org operates on a pretty small budget, largely using
> infrastructure donated by kind entities. If it suddenly becomes a
> liability, I'm sure those entities will kick us out. A large, sustained
> DoS attack would be one such liability, and due to the nature of git, we
> can't really hide behind cloudfront or any other DoS-mitigation
> platforms.
>
> If a DoS attack is waged against Google's gerrit server, they can drop
> the packets at the perimeter and still keep the service available to
> Google engineers coming from internally routed traffic. This is not an
> option for kernel.org, so a DoS attack against a central resource would
> be super effective in stopping all work on Linux.

This isn't how DOS mitigation works. Gerrit uses the same DOS
mitigation as www.google.com, and we don't drop external search
traffic when things get bad.

If we can be behind a DOS protection service, kernel.org could also
be, but I think it would require using the HTTPS protocol rather than
SSH or anonymous git.

> >How does DoS protection for kernel.org work today? If someone DoSes
> >git.kernel.org with its 1000s of git trees, how do people get work
> >done?
>
> The git trees on kernel.org are just convenient copies. Most kernel
> development is done via mailing patches, which is a distributed and
> DoS-resistant process. The only time git.kernel.org enters into the
> picture is when people need to send a pull request to Linus (via email).
> If kernel.org is out for an extended period of time, they would just
> push their repo elsewhere and send a pull request referencing the new
> URL. Since Linus checks PGP signatures when pulling remotes, the
> repository can be hosted anywhere at all without needing to trust the
> infrastructure.
>
> With gerrit, if gerrit.kernel.org is down, then everything grinds to a
> halt. If it's down for an extended period of time, then in theory people
> can push their git trees elsewhere, but then they would have to
> force-push back to gerrit once it's back up.

We ourselves are not worried about downtime because our deployment was
designed to be 24x7 from the start. Our corporate overlords (large
projects such as Chrome and Android) do not accept any downtime. I
would be happy and proud to host the Linux kernel development on the
same infrastructure, which would give you hosting without downtime.
However, if there is consensus that there can't be a centralized
infrastructure of any sort, then that isn't going to work, obviously.

> >> 3. There is no email bridge, only notifications. Switching to gerrit
> >>    would require a flag-day when everyone must start using it (or stop
> >>    participating in kernel development).
> >
> >Gerrit sends out email for comments. If you reply to that email,
> >Gerrit ingests the comment and puts it in the review.
>
> Ah, okay, I guess we've never configured it that way. But you can't
> +1/+2/Merge anything using this mechanism, right? Otherwise that would
> be a backchannel around authentication. :)

it doesn't allow voting exactly for the reason you mention.

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich

Registergericht und -nummer: Hamburg, HRB 86891

Sitz der Gesellschaft: Hamburg

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
