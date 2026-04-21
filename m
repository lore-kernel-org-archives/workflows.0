Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8C38003D
	for <workflows@vger.kernel.org>; Tue, 21 Apr 2026 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776733480; cv=none; b=ACtmyf0QO+/XZmOlv4Qy0+mMTIGeSfWt7PKLN00KV7sXRqNSows9kvZDYZMpRBTEAePw9XsSjW7grNXh71EuZL8ZXwhbRp91b38d/6WlAk74kQ5HjtMWHuMOVqrozfqP5YHctLwYExWGH72Qnka4tyGxK5rK7MFQWG5OnWLNc4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776733480; c=relaxed/simple;
	bh=gkFNkdmvdKEts7yRgdVBxuFyMrzs7CXq96VbqoGR6vE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XkC3FzKN+sDokVmNsWdFFXHU13zL+jl98VSqRxCtyJdflglwUb2uC0k4OoyIuNaQaPyl74VFqkZtY/gy0PgFXhrNq3H8qIL8zRLADrzoxGnZINXUuJzkI+MXugk09+9Mn0oQ57PDitHGaKjaacFJc7Az/cS74g6MNmnkSIrqlT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com; spf=pass smtp.mailfrom=truealter.com; dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b=ADZ4PFr0; arc=none smtp.client-ip=79.135.106.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truealter.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truealter.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truealter.com header.i=@truealter.com header.b="ADZ4PFr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=truealter.com;
	s=protonmail; t=1776733469; x=1776992669;
	bh=BUgSo3jQ6u0wqWOPlFUrYRozqt5hVKqIdfN34DvYi3Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ADZ4PFr02BClyWy3sNSsHvMvBvdDANy2i/Z4PuJUilNu3liRFLIrLCIoup2v1+RvT
	 1wQNjo0uqSPrkPafK5GpOn9kQTNFpPvnW8ydYEPCPGoVd2qUhyrxk+27b7qmmnag5r
	 nbLsDAY41did84dr+yTZTwyq3Ck6uhjyzfw6IGeSQd9Wscx319JEIJzFMLPBGUW4Tr
	 7X3QOJomSKVyT/Qk638LNoMQnUAxOWr0wohUyq3UvppR30hEQPa8WZiFBxZYjNMfJG
	 RPlr5r6JF6yL7k5vB04NSksjZNI5J9yVOToCR1JWaKza8yLYlrhGuT2C59Gj7EQN06
	 bW0V1srDnI0lQ==
Date: Tue, 21 Apr 2026 01:04:24 +0000
To: Greg KH <gregkh@linuxfoundation.org>
From: Blake <blake@truealter.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-assistants: add optional Acted-By: trailer
Message-ID: <IF6AC3bPCYsGyyxsgSQlwZXnA3BJJh61OW6a3KznzbsmDPG4DtricBAzsxyOjDQZ-RHBEkgsjRdaVKQ6i8gqv1bd2AGwC0BTJwBErNHOqx4=@truealter.com>
In-Reply-To: <2026042035-retention-platonic-e5d5@gregkh>
References: <20260420142741.3187814-1-blake@truealter.com> <2026042035-retention-platonic-e5d5@gregkh>
Feedback-ID: 187617253:user:proton
X-Pm-Message-ID: bf76b1cc5c0127393096e6777cfaf8486632070d
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, 21 April 2026 at 3:40 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
> I really do not understand, how would this actually be used?

Git history uses email addresses as the de-facto identity key and
email addresses aren't stable across a lifetime or a career and,
increasingly, aren't meaningful even within a single commit.
Contributors move between employers and domains over time; companies
rename and migrate their workforce onto new domains; and plenty of
commits land with From: lines like blake@desktop or
root@localhost.localdomain because git's username@hostname fallback
fired before user.email was set.

.mailmap partially fixes the first case inside a single tree but
doesn't travel across repositories and can't synthesise an identity
where the From: never carried one. A declared Acted-By trailer gives
the human a stable key that survives employer changes, domain
migrations, misconfigured clients, and cross-tree lookups.

> And as you have to have a signed-off-by, why would you use two
> different names for yourself this way?

Signed-off-by and Acted-By answer different questions. Signed-off-by
requires a real name for DCO attestation. Acted-By names the stable
working identity the same human operates under across contexts =E2=80=94
which for most contributors on a stable setup collapses to the same
name, and the trailer adds nothing. They diverge when:

  - the same human contributes under different employer emails over
    a long career;
  - an employer renames and migrates its workforce to a new domain;
  - a contributor publishes under a stable pseudonym but their DCO
    Signed-off-by has to carry their legal name;
  - the From: line is machine-generated noise (blake@desktop,
    user@hostname) and carries no identity information at all.

> And who is asking for this?  Who would want to use it?  How would
> you use it for this very commit?

For this very commit I wouldn't need it as Signed-off-by is
sufficient. The patch defines a slot in the docs; the commits that
benefit from the slot are other commits in other trees where the
divergence cases above bite. Pseudonymous contributors and
long-career maintainers whose email addresses have changed are the
current constituency; anyone writing provenance or review-routing
tooling that today falls back on email-fuzzing is the other.

If the sense is that optional trailers with narrow audiences don't
earn a footnote in coding-assistants.rst, I'm happy to withdraw and
keep this out-of-tree.

thanks,
Blake
