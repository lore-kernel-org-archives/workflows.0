Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B7FC2BB3F
	for <workflows@archiver.kernel.org>; Mon, 20 Nov 2023 22:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232463AbjKTW1p (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Mon, 20 Nov 2023 17:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjKTW1p (ORCPT
        <rfc822;workflows@vger.kernel.org>); Mon, 20 Nov 2023 17:27:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A3092
        for <workflows@vger.kernel.org>; Mon, 20 Nov 2023 14:27:40 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70DDC433C7;
        Mon, 20 Nov 2023 22:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700519259;
        bh=0jOUHGCwKxgzLTwAREMVP/be39sK8VQWFmVkIgVKzRY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tA/gMsnubJUZ5lprsnSOowJATircK+pIrE44RHnOwkBVvFb7/FHhyPiu7O3DFe2Ro
         4sO5kc4XMVFFMQgvjuOaEfmdkNbPiOKztfdQrB51lN1yP3hryjCeU010gf7Cl3pIev
         O/D1nGnsj51nBrXrNko5i0ta/cl+9Y50LwQH7j28qAyGBMzYLFwG7ztTnX0Vxq3wuT
         2PAvuvjyJMj6B9UdI4LTIFOV6fe6NRsD2ThzVVIrVBjbFc8eJDRL+wRvqBIYg2I9qj
         GFSA3Vg7q7ihmv41NZbZLEglIVyNW67g1eLr79iEEsLN79WU9lusXviwB96Fi6nSzN
         7RcVgOewsH4vA==
Date:   Mon, 20 Nov 2023 22:27:33 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Theodore Ts'o <tytso@mit.edu>
Cc:     Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>,
        Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>,
        workflows@vger.kernel.org, joe@perches.com, apw@canonical.com,
        davidgow@google.com, rostedt@goodmis.org,
        skhan@linuxfoundation.org, djwong@kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        vkabatov@redhat.com, cki-project@redhat.com,
        kernelci@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <92c2f89d-f8a6-4260-b10d-671011cf1f70@sirena.org.uk>
References: <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <87sf50imba.fsf@collabora.com>
 <20231120205131.GA291888@mit.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="W/tyPRnz8XNYyIuZ"
Content-Disposition: inline
In-Reply-To: <20231120205131.GA291888@mit.edu>
X-Cookie: <Manoj> I *like* the chicken
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--W/tyPRnz8XNYyIuZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 20, 2023 at 03:51:31PM -0500, Theodore Ts'o wrote:

> What we have at work is a way to upload the test results summary
> (e.g., just KTAP result lines, or the xfstests junit XML) along with
> test run metadata (e.g., what was the kernel commit on which the test
> was run, and the test hardware), and this would be stored permanently.
> Test artifacts is also preserved but for a limited amount of time
> (e.g., some number of months or a year).

> The difference in storage lifetimes is because the junit XML file
> might be a few kilobytes to tens of kilobytes. but the test artifacts
> might be a few megabytes to tens of megabytes.

This is the sort of thing that kcidb (which Nikolai works on) is good at
ingesting, I actually do push all my CI's test results into there
already:

   https://github.com/kernelci/kcidb/

(the dashboard is down currently.)  A few other projects including the
current KernelCI and RedHat's CKI push their data in there too, I'm sure
Nikolai would be delighted to get more people pushing data in.  The goal
is to merge this with the main KernelCI infrastructure, it's currently
separate while people figure out the whole big data thing.

> Of course once you have this data, it becomes possible to detect when
> a test may have regressed, or to detect flaky tests, and perhaps to
> figure out if certain hardware configurations or kernel configurations
> are more likely to trigger a particular test to fail.  So having all
> of this data stored centrally would be really cool.  The only question
> is who might be able to create such an infrastructure, and be able to
> pay for the ongoing development and operational costs....

The KernelCI LF project is funding kcidb with precisely this goal for
the reasons you outline, the data collection part seems to be relatively
mature at this point but AIUI there's a bunch of open questions with the
analysis and usage side, partly due to needing to find people to work on
it.  My understanding is that ingesting large data sets into cloud
providers is pretty tractable, as with a lot of this stuff it gets more
interesting trying to pull the data out and comprehend it in a practical
fashion.  It'd be really cool to see more people working on that side of
things.

On the submission side it'd be interesting to start collecting more data
about the test systems used to run things, might be useful to add a new
schema for that which can be referenced from the test schema.

--W/tyPRnz8XNYyIuZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVb3VQACgkQJNaLcl1U
h9AAywf9H7Dzbu0aNpWDX4osAMlrLJ3HYs3A24OOVIskqWE6ACkvbL4NXD44DyHt
a/u5Rfsach/H5bRgNI+hWWiAVwlMx574dCZcmBOxw7osjVqPK4FiSVHQNGENh59F
8L2cFcoyxjA5UyUUKxczfmgQNhqt1LAr1bDW+y2wRaVONnwQu9eXXYirQUfVZrpT
JwhTmkVsCvBoeE8f/w4UbvCU6/QCVIhg8pm7wdiOK4VVDvzZSkKR1A80ALvZcw69
FRUA0FNF3qWdirU1juf4GENDtlpeiDTly1UECeOXgy6dbZ8uU0Jmr7ytWStXWJ6o
FOQroLJoHsHZwIwRlxCWgGE5ak1XeQ==
=0jNL
-----END PGP SIGNATURE-----

--W/tyPRnz8XNYyIuZ--
