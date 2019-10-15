Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2C8C10F14
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95DB420872
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:15:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TWTuCnHB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729479AbfJOTPp (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:15:45 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:45253 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfJOTPp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 15:15:45 -0400
Received: by mail-ua1-f67.google.com with SMTP id j5so6425350uak.12
        for <workflows@vger.kernel.org>; Tue, 15 Oct 2019 12:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wdvDVyMI1mpRw9qmE3CPSDnq8tmkCreanZ15D2lYY3w=;
        b=TWTuCnHBWm7+Q4En9ba/XuVWoGvT6A3NI7bgv8B1mgPIgkNKMpsixvlNKEZ+Hv7BXi
         m2GjisIQFZqXnZzLgRYhEd4705ArE0pa3fStBCOBYGabCabjnFjlm3QqkiQdRsfYKap4
         cpZH+YN3/qkEBNNWq9Itot3bRzglNXEomm3a72mnb/peWeswItmTFr24tDc40uzMLmAB
         8upE924n2sWIlNrt94hHFsiiTlhQiu6Sg2kPSmhzAxJ0xHmR2vKOa+twxk6yV/ebH2BD
         cUTeuFmuE7S1RZVolNsVkZnJ5ls5y/i9FcfLmAdC7wiNqYjm1/+J/LXMmT5Z2oe1KGe4
         rhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wdvDVyMI1mpRw9qmE3CPSDnq8tmkCreanZ15D2lYY3w=;
        b=doHHEhdXb9GklcElrIPUr05D0Z2UPoGnhmndMV+E/urLHLJ1jBM5PpWW1VE8MSV/FS
         JeIvOKkWTpLe2MUKGzFEK+HE+F/TZxaxEX9vZoeAmEeYer50QnopnJNQQeLhd/9D07MD
         I+MPgb3SM8aoo4+2TxL3bpnZ+V/0YNPTi+5xreDM0QUM8Z4lbambzUrZyAQ2Naxr4ulc
         Iz/eeMXqVpwlLky94oZ952WlTTDNg/59TLPzjcfsP7hz/evvgrLQ0688qPTGaM7CwICO
         vzQUNE0P1fLsjcdUuvzZUDGJYPdm7rM3ZDJw5dJ05rpT8wdToJF/+R3FLxgkNnf5Juue
         UU7Q==
X-Gm-Message-State: APjAAAUQ1tX4h5eFeRBPN7hJZ68OFKS6n4q0InCgEBYssA/eG+3vDOlK
        xoAZ6IoMXVVdKTgawrBLcZie5q9OrsNGG7IrwuowSg==
X-Google-Smtp-Source: APXvYqwlvj4pR61McCG6ti9DyDkwAy94e4/SRqeez0cuG+ITnoOYPRihH7wlPLBF/zJgnAgBEwEd4JVmwsrXMpeQ3KY=
X-Received: by 2002:ab0:4267:: with SMTP id i94mr15308799uai.16.1571166941572;
 Tue, 15 Oct 2019 12:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191007211704.6b555bb1@oasis.local.home> <20191008164309.mddbouqmbqipx2sx@redhat.com>
 <20191008131730.4da4c9c5@gandalf.local.home> <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local> <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015183752.GB5473@chatter.i7.local>
In-Reply-To: <20191015183752.GB5473@chatter.i7.local>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Tue, 15 Oct 2019 21:15:27 +0200
Message-ID: <CAFQ2z_OyzfGDKQgzWNGoj4dpx-15B=kZkmOvJr9LU5AjfK=y0A@mail.gmail.com>
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

On Tue, Oct 15, 2019 at 8:37 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
> On Mon, Oct 14, 2019 at 09:08:17PM +0200, Han-Wen Nienhuys wrote:
>
> >To 2) : Google needs special magic sauce, because we service hundreds
> >of teams that work on thousands of repositories. However, here we're
> >talking about just the kernel itself; that is just a single
> >repository, and not an especially large one.  Chromium is our largest
> >repo, and it is about 10x larger than the linux kernel.
>
> Kernel isn't a single repository -- most maintainers have their own fork
> or multiple. Git.kernel.org is now over a thousand repositories (mostly
> forks of the kernel).

I've heard this before, but it's not clear what problem you are
solving in this way. They're all based on the same commit graph, so it
could just be a single repo with 1000 branches.

> >Git is a tool built to exchange code and diffs. It seems natural to
> >build a review solution on top of Git too. Gerrit is also built on top
> >of git, and stores all metadata in Git too, ie. you can mirror review
> >data into other Gerrit instances losslessly.
>
> As I see it, there are the following things that would make Gerrit a
> difficult proposition:
>
> 1. A gerrit instance would introduce a single source of failure, which
>    is something many see as undesirable. If there's a DoS attack, Google
>    can restrict access to their Gerrit server to limit the requests to
>    only come from their corporate IP ranges, but kernel.org cannot do
>    the same, so anyone relying on gerrit.kernel.org cannot do any work
>    while it is unavailable.

I don't understand your scenario. Are you concerned that Google would
protect DoS attacks by limiting traffic to the corp network?

Or are you concerned that kernel.org has no DoS protection?

How does DoS protection for kernel.org work today? If someone DoSes
git.kernel.org with its 1000s of git trees, how do people get work
done?

> 2. There is limited support for attestation with Gerrit. A change
>    request can contain a digital signature, but any comments surrounding
>    it do not. It would be easy for the administrator of the gerrit
>    instance to forge a +1 or +2 on a CR making it look like it came from
>    the maintainer or the CI service (in other words, we are back to
>    explicitly trusting the infrastructure and IT admins).

Does anyone use attestation/PGP signing for their code reviews that
are conducted over Email? How many people use PGP signing on their
commits?

How does email figure into this story? Email has no authentication at
all, so if this is a requirement, you should probably stop using email
for reviews.

> 3. There is no email bridge, only notifications. Switching to gerrit
>    would require a flag-day when everyone must start using it (or stop
>    participating in kernel development).

Gerrit sends out email for comments. If you reply to that email,
Gerrit ingests the comment and puts it in the review.

> >By contrast, a centralized server can authenticate users reliably and
> >the server owner can define such rules.  There can still be multiple
> >gerrit servers, possibly sponsored by corporate entities (one from
> >RedHat, one from Google, etc.), and different servers can support
> >different authentication models (OpenID, OAuth, Google account, etc.)
>
> How would multiple Gerrit servers operate if they are backed by
> different authentication models? Something like a replication plugin
> would require that each of these instances are fully trusted sources of
> truth. I am not sure Red Hat would be happy to fully trust a replication
> stream coming from its direct market competitors, especially if they are
> in a position to forge identities.
>
> Or do you mean they are separate instances and a maintainer would pick
> where to host their subsystem? But then, if they pick Google's gerrit
> system, how would engineers from China be able to participate?

I mean the latter.

The question about China is a good one. If access from China (and
Iran, North Korea, etc.) is a requirement, that would be useful to
document.

> Generally, unless there is a way to run Gerrit without explicitly
> trusting the infrastructure and admins, I will be in strong opposition
> to choosing it as the solution.
>
> -K



--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich

Registergericht und -nummer: Hamburg, HRB 86891

Sitz der Gesellschaft: Hamburg

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
