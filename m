Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550A930498E;
	Mon, 20 Jul 2026 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784578810; cv=none; b=affHulNxVcR3vN0sSgkhhaYeMGUE/i19iTj28iIRdbUyWw0cP6VJegOCEd2P0cfP7/Ld8eY3tcs+QoVCxanRq6LykFgrZQVxEvlr1Kj0MnHiMrSXw8+om8IsGuDyYtwa565KfX/Db5nl1YNg0/UwlUMgWAANHhYfkVQGsPvutJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784578810; c=relaxed/simple;
	bh=0oK9WSP8VpzhyvNFOcrN2KLbIUxcWYpxvyvgAjRAfLE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sFcOG14N9VTTaMQ5Ln8ycNaiu1/8uzACB4jeT41kIZqp5j0u2Z8Ez9XUl1UF2xWgEIVKMG36NCO3DU3DkvHA0C2CMi6vfumtA23jkftXunkRQzJCyAWR8nV8C35iT+24FrEBLVtBMyLfoCZ/rCnQcNYdIQxLqgsMHXtfy1HK8Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=P6x7YaAy; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="P6x7YaAy"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 82ED7408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784578808; bh=c2p6uzDyt6XL+dkZim20UJrR1zm9YfSlJJ9fh0IeMFw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P6x7YaAykVx7V9jtTueuqzAaJXuK6tDQen+C6ZuxaNIaXlwO8fYSHoFAMgzoA2EUW
	 uhbSp9bYryv97Yx1dg6Ik1TBI+o1s+wIBKCi51TAEjDsFpL3fIKPXkxVtRavaJ9ryG
	 X8QAn77ubu9fJH06poK9rIUtPN1W7lNBLvMYSip8+Gahh4K4YuywL8nU5CkiSp1NZ4
	 ceBYGS0RcJQDPRYJLUyn+HB1oO9pt5oeLHer3zBqlXE/9VBVevJePRskOgb0ebX0rm
	 4RTsSojjsGUSE0RVgEp5bWwAohEggJwcZ3YjChk4ZFVtXCGcOvN8+qt2yl6AONx3ps
	 lsraepklBDkUg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 82ED7408B2;
	Mon, 20 Jul 2026 20:20:08 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Saravana Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF
 maintainer profile document
In-Reply-To: <3e797ffc-8cf6-437c-81f2-9f82d946d042@oss.qualcomm.com>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
 <87y0f531uz.fsf@trenco.lwn.net>
 <3e797ffc-8cf6-437c-81f2-9f82d946d042@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:20:07 -0600
Message-ID: <874iht2z2g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> On 20/07/2026 21:19, Jonathan Corbet wrote:
>>> I expect patch to be picked up by Rob, after review.
>>>
>>> Changes in v3:
>>> 1. Add also F: entry
>>>
>>> Changes in v2:
>>> 1. Correct typos and trailing white spaces.
>>> 2. Fix order of P: after C: in maintainers.
>>> ---
>>>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>>>  MAINTAINERS                                   |  3 +
>>>  2 files changed, 73 insertions(+)
>>>  create mode 100644 Documentation/process/maintainer-devicetree.rst
>> 
>> You'll need to add this new file to index.rst as well.
>
> Hm, where? In docs/process/index.rst? None of the other maintainer
> profiles are mentioned there.

Sigh...I stand corrected.  I'd forgotten that we merged the
maintainers-profile-toc Sphinx magic that picks them all up from the
MAINTAINERS file entries.

Sorry for the noise,

jon
