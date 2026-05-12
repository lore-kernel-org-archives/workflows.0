Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAFA385D95;
	Tue, 12 May 2026 17:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778606453; cv=none; b=kXfm542OEus88uDOfeR6dqU6dIdqc94YuAsZgci90HCI/L39sdyKkRiwcrl/CTeJWN9hxVtqOSw4LWnTQYB/B5wpBQCyEup1gogku13bV5i9lWG2CGeydDcUakM4gFBQBERQd12pP6+SIX42S6wIbMIGBYwqHMw1gSmZ325+95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778606453; c=relaxed/simple;
	bh=Sa2oCANbMqA5RQN8GRYDhObhbYpU8oTT5W9wAoxyK9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TWsPT6DksI+25KP8h1PqfPEk7AWr9kdxcYy4zepm0zaWGRWtP19GXHjs5tr27NY0+ZM4c8G2y7VXzAarFvwhVlwnd4fWr+cAFouf+FgsVdu+eYcW2JqB2alzWd/pheg/kyoNxsZyRmAefI5ZG49XgcdxHlqA6lU4L4nuZeYw2Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K8FjYK6s; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K8FjYK6s"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 04580410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778606452; bh=FeTFQ0ljYqvimxbPqoCPz+BY52gfIXegmilLy+DrcVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K8FjYK6sqjDmO6a5YMI1BS0OVjTUjobNOFUybElqQF9XSrBIq9AZF6H0SzBLa8xvZ
	 aeZFZriGzf/QerjPkgJdO1CCi3zvyv9SPw7cPtqdJhgIk63syHePUQiq4dGLEWlDY+
	 GLndTCQW6dR/zxDB2xCo6Fuiq95gJpjCUD8w5t5jc481nnAALNWYffsKM0D4zIp6xb
	 7teaoabtIMdbUR81SsJDhUzqNMLb3uen8sBG6b6fkGtMfJhlGuzn9ebR5Okh4txccg
	 okGhCuYyTDjbYkNyNQB04rUz8RUNRDveTP5Yv0IWKUlQ8/QXejox+cBwP2gBQVuhU3
	 xYz++XhVIYNfw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 04580410B5;
	Tue, 12 May 2026 17:20:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, greg@kroah.com
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Willy Tarreau <w@1wt.eu>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <20260509094755.2838-3-w@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu> <20260509094755.2838-3-w@1wt.eu>
Date: Tue, 12 May 2026 11:20:51 -0600
Message-ID: <87wlx8o87g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

> The use of automated tools to find bugs in random locations of the kernel
> induces a raise of security reports even if most of them should just be
> reported as regular bugs. This patch is an attempt at drawing a line
> between what qualifies as a security bug and what does not, hoping to
> improve the situation and ease decision on the reporter's side.
>
> It defers the enumeration to a new file, threat-model.rst, that tries
> to enumerate various classes of issues that are and are not security
> bugs. This should permit to more easily update this file for various
> subsystem-specific rules without having to revisit the security bug
> reporting guide.

One thing here:

[...]

> +* **Capability-based protection**:
> +
> +  * users not having the ``CAP_SYS_ADMIN`` capability may not alter the
> +    kernel's configuration, memory nor state, change other users' view of the
> +    file system layout, grant any user capabilities they do not have, nor
> +    affect the system's availability (shutdown, reboot, panic, hang, or making
> +    the system unresponsive via unbounded resource exhaustion).

That is pretty demonstrably not true, and will likely elicit challenges
at some point.  There are a lot of "make me root" capabilities that
enable users to do all of those things; consider CAP_DAC_OVERRIDE as an
obvious example.  I think that just about all of the capabilities will
enable at least one of those things - that's why the capabilities exist
in the first place.  So I think this needs to be written far more
generally.

As a lower-priority thing, lockdown mode is meant to at least try to
provide some stronger guarantees, and lockdown circumvention seems to be
normally be viewed as a security bug.  Worth a mention?

Thanks,

jon
