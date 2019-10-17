Return-Path: <SRS0=PtRO=YK=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0621AFA3733
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 10:22:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C1AB72082C
	for <workflows@archiver.kernel.org>; Thu, 17 Oct 2019 10:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FerxmJ9U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392694AbfJQKWc (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 17 Oct 2019 06:22:32 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:39676 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbfJQKWc (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 17 Oct 2019 06:22:32 -0400
Received: by mail-vs1-f46.google.com with SMTP id y129so1216380vsc.6
        for <workflows@vger.kernel.org>; Thu, 17 Oct 2019 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kd06K1ML+gexuht775H03lTcU6IAD7L8aE6j+6vt8gY=;
        b=FerxmJ9UqFQap/U0KsefF0H32T2mhh60VIlzEmZFKvrb1czl+tN6SCKx/L+IUUutiX
         v4GSO9gWE7T7dAdnloRGb2YFayEvVHPz52SZXkSZagMGF1x3VjcAF31m8jQXfelA62mj
         rbQzPVJMc0LxM3QcBVpvVxe50wPQ0qsc5yE5BaBfAKn4uAZWPpSwAwxKseFHMlK6OcbB
         Mygjc9wWCUauDyFaLab/5JPkRM+BHQt0Vtsk8ut/IOGwP4dO+DYEkYUpkQ5HRt8Di6BS
         KiQ+bL8JRIFlzNf6fzk/rEz+JZ11rbWMjek06ov181D5WF4uVOETe+2KGywx78TiMtSs
         W3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kd06K1ML+gexuht775H03lTcU6IAD7L8aE6j+6vt8gY=;
        b=a3g4c2UcKjw3PKbxw+4VzyVhkiLSaGGGKfbZ/GUxRLmIkhb129IgY7u2TU0PlbWfKV
         B1CvxtSMz80Hf8R6JOrOtz6iVh+pC6z46f8+v/98dl3cNLT0wGae0LWkx3yuEuLZ9huu
         g1AmtiVIvus71GWEyZxQSqp7YfGsYQRRprJUCqzr81Rh5YsZ/0QsW30g9vVBw3PGPhJ/
         ZeIUkRZfPuryT9zUGgV+yZ3HEDlZrHcuovbKoKmkcR9sT6mLDpjGm9dsw1q/611mQN9I
         sX0JYlfCUrzmJoxDwu/Lv2A9P7Z3XVjeFPVlSmDHCNh/goXOm5eX/TnfKzpD57XvNeD+
         SfWg==
X-Gm-Message-State: APjAAAV14DFd9voTxH5KcBsBzCC2lKX88FHRhvqEv8mATWbapNVZA6Nv
        CsO3hZJqoscjVsdFO3kOB30r7+Cj0misptXEeLc4rQ==
X-Google-Smtp-Source: APXvYqweBQLJ5oXpZwY2KG0l+NzyAid5HFYpTNcCGeRs6poJAgO63TzbB7JVzsnhj6kUAnmThwgEGla8snDOpTY+MkQ=
X-Received: by 2002:a67:dd18:: with SMTP id y24mr1398028vsj.203.1571307750620;
 Thu, 17 Oct 2019 03:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local> <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu> <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015015425.GA26853@mit.edu> <CAKMK7uGtvqFSw+wOBeGjV88DeyUoMTV3+F4Fpqv6NGUBCkAAgA@mail.gmail.com>
 <CAFQ2z_Pxc=0LjEieUC7Dz_sQiUKBr2oKUVrW7Fppj5AQbD_W5A@mail.gmail.com>
 <CAKMK7uGseMAmmLkawkaMMJgK=XAXoK+vOP8Uo9obXpss_v+WYQ@mail.gmail.com>
 <CAFQ2z_OVwS0Ups1QCEvJBFTsZmsw1u25bJh+a3xArjhXggLqcA@mail.gmail.com> <20191016190852.GG4881@sirena.co.uk>
In-Reply-To: <20191016190852.GG4881@sirena.co.uk>
From:   Han-Wen Nienhuys <hanwen@google.com>
Date:   Thu, 17 Oct 2019 12:22:18 +0200
Message-ID: <CAFQ2z_PVSO9Uas0sRNbEOSTUsKqN_49+u+HYuZemz_hECRPLKA@mail.gmail.com>
Subject: Re: thoughts on a Merge Request based development workflow
To:     Mark Brown <broonie@kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        "Theodore Y. Ts'o" <tytso@mit.edu>,
        Dmitry Vyukov <dvyukov@google.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
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

On Wed, Oct 16, 2019 at 9:09 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Oct 16, 2019 at 08:56:53PM +0200, Han-Wen Nienhuys wrote:
>
> > With the email workflow, isn't it hard to keep track of which patch
> > went into which tree? Something that tracks the identity of commit
> > (like Change-Id) as it travels across trees could help here.
>
> Once something's in git it flows into other trees via merges so the
> commit ID is stable, the exception is backports where the ID from
> mainline gets referenced in the backport.  Normal development doesn't
> use cherry picks really.

Right, so once it's in Git, the review story is done, and everything
we've discussed so far is really only about what happens before the
merging?

--=20
Han-Wen Nienhuys - Google Munich
I work 80%. Don't expect answers from me on Fridays.
--

Google Germany GmbH, Erika-Mann-Strasse 33, 80636 Munich

Registergericht und -nummer: Hamburg, HRB 86891

Sitz der Gesellschaft: Hamburg

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
