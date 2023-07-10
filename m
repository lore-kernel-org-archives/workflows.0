Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B03EB64DA
	for <workflows@archiver.kernel.org>; Mon, 10 Jul 2023 19:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjGJTjq (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:39:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGJTjp (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 10 Jul 2023 15:39:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F4E9E;
        Mon, 10 Jul 2023 12:39:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2799A611A8;
        Mon, 10 Jul 2023 19:39:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAEEC433C7;
        Mon, 10 Jul 2023 19:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689017983;
        bh=ernk864sCWu4fBl7VhZE7tFQQg9vQ7iqqyymWeIABp8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KDnDZZ4YvYMrFt7l8Mt8NZ5ak2zru2ncMyphxPA6q8+v8uPOQtvHSpiZSTB03x9Qi
         48dioItGxAxRt2O5P+SBtdNRo8N8dTRiCI4rhuZ1eLMFDJZAkfIzF6Izhz//MRqH1V
         1f2oT39u/lk3H2RrmDAp6pWuCFdImAQQBWbqg4OzjSr2OtwozQwDCD/JV6bqNBYv8v
         ewk86yOimXOR0HpTQ7FY61oFQvUQGOrjZBH5zSTghoGakUPYIR4zyyHyQx2iSP0dh9
         TCZZjfHIKXFSV8aYGirwHng/ZY9SKC0DZK6ySoklHvkAMRAch6PHjiltRerDm+hPTp
         0xrJrfNWxNbww==
Date:   Mon, 10 Jul 2023 20:39:40 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: Docs for base maintainer expectations?
Message-ID: <20230710-veteran-progeny-fee091cfff3c@spud>
References: <20230710115239.3f9e2c24@kernel.org>
 <20230710-snowboard-bannister-7ed66c8d742b@spud>
 <20230710122228.545d93be@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="y04JnO3VBR+Fad4g"
Content-Disposition: inline
In-Reply-To: <20230710122228.545d93be@kernel.org>
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--y04JnO3VBR+Fad4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 12:22:28PM -0700, Jakub Kicinski wrote:
> On Mon, 10 Jul 2023 20:06:56 +0100 Conor Dooley wrote:
> > On Mon, Jul 10, 2023 at 11:52:39AM -0700, Jakub Kicinski wrote:
> > > do we have any docs describing what's expected from folks stepping up
> > > to maintain (small-ish) parts of the kernel like a driver or a protoc=
ol?
> > >=20
> > > Experienced developers / maintainers differ like the beautiful
> > > snowflakes that we are, but outsiders have much less familiarity=20
> > > with the landscape, and frankly sometimes much less interest in
> > > participating once they code lands.
> > >=20
> > > Which makes we wonder if a simple list of responsibilities would be
> > > useful as a baseline. =20
> >=20
> > > I haven't spotted anything in Docs/process but
> > > perhaps someone has a local version for their subsystem? =20
> >=20
> > Given I figure you did this on with a -rc1 based tree, which would mean
> > that what I wrote probably does not fit the bill, but I tried to do
> > something along these lines with
> > https://docs.kernel.org/process/maintainer-soc.html
> > for which my target audience was people picking up maintenance of
> > DT/soc drivers, which I hope there'll be a few of in RISC-V land soon...
> >=20
> > I suggested adding things to it, like putting the trees in linux-next
> > etc, but review feedback suggested that was unsuited to a subsystem
> > specific document.
>=20
> Thanks for the pointer! I haven't read it before because I assumed
> it'll describe workflow and suggestions for SoC sub-tree (which it
> does?)

You did mention "local version for the subsystem", but maybe by local
you meant on their own box, rather than local to the subsystem. I
interpreted it as the latter, sorry about that!

> I was thinking about something way more basic, like "you are
> expected to reply to bug reports", "you are expected to investigate
> syzbot problems" etc. :(

Yeah, along the lines of the generic stuff it was suggested that I
should not add :)

> IOW the SoC guide reads more like "how to get your code accepted" rather
> than "what are the externally-facing responsibilities of a maintainer".

I suppose it is a bit of a mix, since the document _is_ aimed at
maintainers of platform support (there's details about sending PRs etc),
but it does contain some conventions that "code" should follow, which
they should in turn pass down to contributors.

It sounds almost as if you're looking for something to present to people
when they add themselves as an `M:` entry against a driver, for when
$company sends a patch w/ someone you've not really seen before?

--y04JnO3VBR+Fad4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKxefAAKCRB4tDGHoIJi
0gInAPwPMensrny+CEtLluvxkCOa7di6BECDuTKUE/W8/dfpxQD/TDTK1Omm7Tpd
c6ji6hPp0yqMutg3FWQu35WN/n//rQk=
=xnSu
-----END PGP SIGNATURE-----

--y04JnO3VBR+Fad4g--
