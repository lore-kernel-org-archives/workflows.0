Return-Path: <SRS0=cg+L=YI=vger.kernel.org=workflows-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85C4ECE58C
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8225B20854
	for <workflows@archiver.kernel.org>; Tue, 15 Oct 2019 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571169054;
	bh=blZS7abVR49/uMHxec5jR1OVyyyr6KJI2kOM2ud7Tdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=cgbg6LYr/duFb5jDj24epxxvoDtK0zDr1FbsDg4aODV0MASLeQxRnZmbYgBNKeg9p
	 EXFKL5gZ+Air54khE/vqvc6V7HaEzMUWHkCqWt+VYhH/xk9jY50rX80UWXWvKRH7EO
	 truaF+IN5Fyfer1JAGfWQsKnEpSMYAcrBhrC4FoM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbfJOTuy (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Tue, 15 Oct 2019 15:50:54 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:46560 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbfJOTuy (ORCPT
        <rfc822;workflows@vger.kernel.org>); Tue, 15 Oct 2019 15:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6yN4Rzj/rM3+0Xt8SotDFZc1Qehp42+cpAaNxtyVev8=; b=SMFu6qkKHd2DxEhST3vlZHzaJ
        iGI93T1jozi3C5/N0gaPvV1MtCsr0NVaPt3U0N/Fd+fJR/3XPy7B0WTR/E8N0QDNiE6D9WssIuYcv
        bYCiCrkoKz0LOC1lMn4HkbOxJyqS9FD5aYn1849JzsZH9kPgEX4joNN109pyjKMgAWuQs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iKSpo-0003La-Dq; Tue, 15 Oct 2019 19:50:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id EF62A2741CD7; Tue, 15 Oct 2019 20:50:18 +0100 (BST)
Date:   Tue, 15 Oct 2019 20:50:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Han-Wen Nienhuys <hanwen@google.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
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
Subject: Re: thoughts on a Merge Request based development workflow
Message-ID: <20191015195018.GC4030@sirena.co.uk>
References: <20191008131730.4da4c9c5@gandalf.local.home>
 <20191008173902.jbkzrqrwg43szgyz@redhat.com>
 <20191008190527.hprv53vhzvrvdnhm@chatter.i7.local>
 <bbf9d038-2238-b97f-7cae-97804ee1624c@redhat.com>
 <20191009215416.o2cw6cns3xx3ampl@chatter.i7.local>
 <CACT4Y+ZJd+3m8zh6m1LtGS0nXQpZbeo3xk=qRjj96wq7gTWwDw@mail.gmail.com>
 <20191010205733.GA16225@mit.edu>
 <CAFQ2z_Pd2bSL+qpTNxwSNUOccvOt1QD9-XeCqqcdHtiNLKeJxA@mail.gmail.com>
 <20191015160712.GD1003139@kroah.com>
 <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="1ccMZA6j1vT5UqiK"
Content-Disposition: inline
In-Reply-To: <CAFQ2z_N0Hriv68HajKZoNg1AyXzd_GqT8a2sDoCRZkUJy_vKSA@mail.gmail.com>
X-Cookie: Yes, but which self do you want to be?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: workflows-owner@vger.kernel.org
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--1ccMZA6j1vT5UqiK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 08:58:14PM +0200, Han-Wen Nienhuys wrote:
> On Tue, Oct 15, 2019 at 6:07 PM Greg KH <gregkh@linuxfoundation.org> wrot=
e:

> > When you are reviewing thousands of patches a year, time matters.
> > Gerrit just does not cut it at all.  Remember, we only accept 1/3 of the
> > patches sent to us.  We are accepting 9 patches an hour, 24 hours a day.
> > That means we reject 18 patches an hour at that same time.

> I'm curious how you come to this number. When I look at Linus' tree.

> git show --no-merges
> 43b815c6a8e7dbccb5b8bd9c4b099c24bc22d135..8e0d0ad206f08506c893326ca7c9c3d=
9cc042cef
> | grep ^Date | wc

> This range is two recent merge commits by Linus about 232 hours apart.
> During that window, 386 non-merge change were merged, ie. about 1.6
> commit/hour.

The overwhelming majority of commits are merged into Linus' tree during
the two week merge window after each release, at other times only bug
fix commits get merged so the volume is way down.  Between v5.2 (July
7th) and v5.3 (September 15th) there were 14605 commits, which comes out
at about Greg's number of 9 per hour.

> > Like Daniel said, the kernel is multi-repos for a mono-tree.  I don't
> > think Gerrit is set up to handle that at all from what I can see.

> What problem is solved by having multiple copies of the same tree?

A lot of what it gives is comprehensibility - people being able to see=20
what's going on in all the different branches in a given area of the
kernel.  You could use namespaced branches to do this but the UIs for
that aren't nearly so good and all this workflow predates even git, this
was all very idiomatic for bitkeeper.

> The normal Gerrit approach would be to have one server, with one Linux
> repository, with multiple branches. Gerrit has per-branch permissions,
> so you can define custom permissions (eg. merge, vote, read, amend
> other people's changes) for different branches. Using branches in this
> way would allow you to retarget a change to another branch without
> losing the review history, or cherry-picking a change to another
> branch from within the UI.

Permissions are all socially enforced for the kernel, there's no
technical restrictions since there's admin overhead for that and at
times it makes sense to do things differently.

--1ccMZA6j1vT5UqiK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2mIvoACgkQJNaLcl1U
h9BRCAgAgy1YWIDJphaswIFRHLEiEJ308PA6eR6SI3Qr5cVb8rSGIf/lB8+GDgm4
MTLrsTArDmsb0ryr8K+MosSXQ4jNgQm4/kkl3GEmepYNFiKwDIuWRQhj3q3IW6Z+
UEjWE8ZdWUwyFYZZkBnTQWIWHZu+oJbR8sO2AqlajlYK+E+/acJMzbcg9pZIrpKS
gUPtvlP9dvq/gdgl/PwXMr7VbLNHeEJzozCGOuUDFand7ey1J/OS9f+5Yv39cROJ
psM1ZTs8H0lMf1XMtAwR1tFkm11Z3mZh8COJj3ULTlqy7Ufq+4LIOzPBF4b8KQxw
59K4ta7gpbe71W1LJo2wKj+KkFWIiQ==
=JRKe
-----END PGP SIGNATURE-----

--1ccMZA6j1vT5UqiK--
