Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6CA35BDDC;
	Mon, 13 Apr 2026 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107011; cv=none; b=hDTuCOV157vx+H3oIZzp6YKc/bUYLfKp4RI2qwVn9WQF5K96rtsqKqi+jwUv+EMsPMd8qJYTaVczIyAfFqarLFgGE01Phgn8J4ah8y6xL13bOdZzzVgK12V06r85U8wcnoxH15JeqKBnBV3VrqmfcHRxwShKK8E1DhO9qYfF08Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107011; c=relaxed/simple;
	bh=PYUq7g8rdm958akGZ3XUgNx9skG3NIVGchkQTTk33os=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=szYGiTfIy5AyYevbytbgjfGIydCmv17pujw9v4r0JWnVYO1/jTYi9tOohYIfJlikAYO0XIIDZvqmrVM4Vk5l0m9Z2cVQORgiPOaOQmGuXXJWEZwZv174c5PV32hmV3keRLBy9XFJrYSp4zl1ntXBljZUg7q9cGkcrZElKKEJXc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Nenmv7dP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Nenmv7dP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 55D8E41084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776107009; bh=uIjiAYkHIVqj3YY4+31pUtOWCeJOQ6EWGMupRVVLLlo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Nenmv7dPFdS/TSHR7vWui6V+Y8gc5A4ReaJx99zedEn9M4LgT8bdXMQLSYpE4gU3B
	 GK0yz3vKvgEVtl+7n6+27FIvOoFGA7Vp4WpzXeoPM0fE+BIOrcnTb38WlH+OpfZ9m/
	 nPvMNBk4t0YmTq5WccTncJSo6FtxVolTUt94qVRTrjxELeXZwf5x/MetC8T9V5ngha
	 WwxyxEKTcKzjhflq9/8OvEdYv5qA460ionijyHxapBMeRoL079SdfJn8JAUL42H+fo
	 CvyMGN8jTIC3l232hACycvBiI+TdxYDJGjIkeCN/dtF43YpG4Q1AOP66dSo15TUMRj
	 nJazYzj911/MQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 55D8E41084;
	Mon, 13 Apr 2026 19:03:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Cc: Linux Kernel Workflows <workflows@vger.kernel.org>
Subject: Re: maintainer profiles
In-Reply-To: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
Date: Mon, 13 Apr 2026 13:03:28 -0600
Message-ID: <87wlyawum7.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Hi,
>
> Is there supposed to be a difference (or distinction) in the contents of
>
> Documentation/process/maintainer-handbooks.rst
> and
> Documentation/maintainer/maintainer-entry-profile.rst
> ?
>
> Can they be combined into one location?

Late to the party, sorry ... the original idea, I believe, was that
maintainer-handbooks.rst would be for developers looking for a guidebook
for a specific subsystem, while maintainer-entry-profile.rst was about
how maintainers themselves should write their subsystem guide.
Doubtless things have drifted since then...  But the intended audiences
were different, so it might be good to think about bringing them back
into focus.

jon
