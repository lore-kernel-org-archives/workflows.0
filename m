Return-Path: <workflows-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CADE4C197A0
	for <workflows@archiver.kernel.org>; Thu, 16 Nov 2023 13:26:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbjKPN03 (ORCPT <rfc822;workflows@archiver.kernel.org>);
        Thu, 16 Nov 2023 08:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjKPN02 (ORCPT
        <rfc822;workflows@vger.kernel.org>); Thu, 16 Nov 2023 08:26:28 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC0E84
        for <workflows@vger.kernel.org>; Thu, 16 Nov 2023 05:26:25 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3962C433C7;
        Thu, 16 Nov 2023 13:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1700141185;
        bh=NEW4FWINNbOUL8o9bqNmk5Tr2wFROtT+sJyLduyLlXs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SK3gn6IPeYEECMJYXJ7fV0Xo+v2lymQN3OVkWKA7rfltlY9AoUBrxRl/QfSxPw/eG
         74YaKwmzPKs7JpCk6e6dqp9ACMUlO4DjXfHySD10Qk9tmbIKyF0j8rWq3v20MWTrFV
         inUbHR0gqQPWX2Sah/lVprSlKmoIqyAhKNgWpFU8MEtxWPuNFQTqt1kL0xRuAEEJcz
         yOHAQ3toZ5hz9kM+r1jZ/xL6uwuPsCzL+f/qe1A6iETDpa9RROoL8Ic0J5x1NTBKDn
         CXjUyRh1pzs0EsnjrF3oqujkukpC7eZmN2gk0CJxBjRyhPaGGpjHcVwyMLqecCtl/h
         xE8fpXJDeAACQ==
Date:   Thu, 16 Nov 2023 13:26:18 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        workflows@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Theodore Ts'o <tytso@mit.edu>, David Gow <davidgow@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "Darrick J . Wong" <djwong@kernel.org>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        CKI <cki-project@redhat.com>, kernelci@lists.linux.dev
Subject: Re: [PATCH 1/3] MAINTAINERS: Introduce V: field for required tests
Message-ID: <195ed085-9f66-4951-bb5b-2d8560f380eb@sirena.org.uk>
References: <20231115175146.9848-1-Nikolai.Kondrashov@redhat.com>
 <20231115175146.9848-2-Nikolai.Kondrashov@redhat.com>
 <20231115-charcoal-sloth-of-wizardry-5a75fa@nitro>
 <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vd17FhC/o3JA19QU"
Content-Disposition: inline
In-Reply-To: <13fe4866-0522-4690-a060-160fdab9f54b@redhat.com>
X-Cookie: micro:
Precedence: bulk
List-ID: <workflows.vger.kernel.org>
X-Mailing-List: workflows@vger.kernel.org


--vd17FhC/o3JA19QU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 16, 2023 at 02:14:24PM +0200, Nikolai Kondrashov wrote:

> Yes, that would be better indeed. However, checkpatch.pl doesn't process
> cover letters, and so we would have no automated way to advertise and nudge
> people towards testing.

Back when I used to run checkpatch it seemed to cope, it obviously
wouldn't find much to look at in there but you could feed it an entire
series with cover letter and the cover letter wouldn't cause any extra
issues.

> P.S. Git forges do that for you by nature of actually running the tests
> themselves, automatically. *Ducks*

The ability of forges to run tests is not hugely relevant to large
portions of the kernel, for drivers you're wanting the tests to run on
the relevant hardware and even core changes will often need hardware
that exercises the relevant features to run.  In these areas you're more
just looking for someone to say that they've done relevant testing but
there's not a substantial difference between say a comment on a pull
request or a followup email.

--vd17FhC/o3JA19QU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVWGFoACgkQJNaLcl1U
h9AeZAgAg+JmZgZNthFaRqyIyCVAR/ZkQ8y/GPd1t66kltaih2DNQN0LgDimZkbL
E1WLk31iwr/3GgYS9cpjmIQfb9ecP/To/qutmOF4BjPbF6xRZWl6JwVWfo87uk4Z
yOWVc02g5PcPZfN+DlEbOuWWovro/LKqYk3UK6UmNyINgAE/i6cCx/NjR5D6lXpK
1SKHlrAYxTD79qi9vS3hEODCCactSKu2n9ezinaf/3iZAIwN6qdDra0wgyZ+RCEF
rbjXmym2EBvPw8yRQXoDIsYlhQi2okscCQAbZQlqP+pMDn2f1raHPczERFVsD65m
y5wUNDGS6XRvOVzSzqbhihz+PID1OA==
=ARKg
-----END PGP SIGNATURE-----

--vd17FhC/o3JA19QU--
