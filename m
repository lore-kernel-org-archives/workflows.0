Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C877EC2BB3F
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 13:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbjKTNbj (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 08:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbjKTNbi (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 08:31:38 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B394AAA
        for <workflows@vger.kernel.org>; Mon, 20 Nov 2023 05:31:35 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A06C433C7;
        Mon, 20 Nov 2023 13:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700487095;
        bh=M8hXpqu/SFXEFGkb7RfUuX8flLLBuh9b/Fq64VoHQpw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hM3nAMwszfDIhSArCnA6KtTsdLLiaLRN1q7rOjqK/oYbLG8IucYrOURECM043OjZo
         gj/3ab3Qphmljn10UavvewFUhR7J+aSEBdqddXOFFd0sgAZGjCAqZvExfqkDDCXEYQ
         4pdVGs4vkXHOn5kVZDvdd/aQuYh5y3eIqHHU12BreIQCU5Es8GfRInSCM3wcwn7d7A
         kFkxgalSXajpyS70czyTIMlEPbmGDxMHZjKQb6V1v40v5YgnZ9OozUShshoy3NA3Zh
         H7zY1YKmRZEzIejoWqiB8NGBmXRHw+ROqsbMNE7iwhORDY/tCyx/oeNDTxSTsVd0od
         TraHh8yq2L6zQ==
Date:   Mon, 20 Nov 2023 13:31:28 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Gustavo Padovan <gustavo.padovan@collabora.com>
Cc:     Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Tso <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev,
        kernel@collabora.com,
        Ricardo =?iso-8859-1?Q?Ca=F1uelo?= Navarro 
        <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <92219e71-4715-44e7-9522-191f268fe22c@sirena.org.uk>
References: <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
 <1341-655b5400-1-5f647c80@80242238>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wpzPcxOY99Tb7/Ji"
Content-Disposition: inline
In-Reply-To: <1341-655b5400-1-5f647c80@80242238>
X-Cookie: <Manoj> I *like* the chicken
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--wpzPcxOY99Tb7/Ji
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 12:40:39PM +0000, Gustavo Padovan wrote:

> I also wonder how to make for subsystems that will have different test
> suites (eg something in kselftests and an external test suite). Would
> an alternative be pointing to a Documentation page with detailed info?

Why not just add multiple test suite lines like we do for other things
where there can be more than one example?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--wpzPcxOY99Tb7/Ji
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVbX68ACgkQJNaLcl1U
h9B4IggAg+T0prKijOeC3QNgobuJ0qxDuMVcNzod2bpIDyBJomSQITktQIs2KqJr
ksVzYw2shK6StpwGpNI6G7vICYLB6pEE0isc0m41MvtqcuewGYFdBJL7SQhtZNBN
YnRAcmNpD/HCj61MK10CZITHwSkDCzf6i2pHl6l00qS6hPeBrh0DmE28GrOvluMa
cpd6/to5SMJPVOMfIcOgmkhUMASpAWtDh4TBzwSou0q1UOkrsMyxvMk0mPF246Ac
X5By5iarDrccmWqzx5wuBLHV4sWEX2mKeVxob+4x1rJKiQFQ5v4o2Y2OCHOOaseA
JvFtSpzIfa+kwJl8u/pBqyDg0dNRew==
=ncnT
-----END PGP SIGNATURE-----

--wpzPcxOY99Tb7/Ji--
