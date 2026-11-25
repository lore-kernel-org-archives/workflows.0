Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795623925;
	b=a2ACzVqU3XmjXEZGax7My8msLMKM1w2locBwkZrWJt3DZla88vS//E1xwvlWO5/zsR4K
	 lzuQvzX0X+8g7uhF4WtT6uEeU4//XuGz9ebE/eVR8Dyo9NksUfFprQzprZWckJQl5kPee
	 3YyZdsptRGfW6a0xxzEyrn0bygMT8JKCHGqcuBnH2MPm06V+qzjBtvhUy5scEb7ZuaOhI
	 j2lpc1maYN1UhUKI10hRe01Y9FFM9JzSRIw/rfK3mOs5fWcmHoFGPvTc8q1nZ5FF7E7W5
	 Ifgv5pL77QoJ7i4bOqU6be1P8We4ec5ruAPUYrt8SjW3O0EO9OKkVR9U58qyuM14XqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795623925;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=61Gx/lVAZ5B3jUJUljRnVPuQwlcQ1+TMpTHXRWWcjI4=;
	b=cOV2TM+3W3DYYpT0KerSV1B80ySXIH34pyOf6K52xbEjwmw5CY8+Bf9U0lgk1yiwGJd1
	 sNqDXCgdLeKaZOZ+ulanNx09xUhiO6GEAx6cmV6wqyK7SMesIbuieA/C11Itmr8PTqomB
	 JwtA1mkos8WY6PK7+ph2JmBFv3ig8v/CSMAEK3eutTyCytIq6wCD96kDhUZsOPisQOYCU
	 PJRmSQpJHF8LG83Lg6EnM+OclvmL4hfPThGiSBPM/hYzrQuaGPIshgnq72xZ/NIM9hIYD
	 Kj6MBQJOSthohb2Q+Lv2Ub8Q+AcCpecIHMQQz4bNs6OXs5B3+5j3XllUu6avI3PE4TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=bVbQB8CG;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C130606A321;
	Wed, 25 Nov 2026 16:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C130606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=bVbQB8CG
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 04877410DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1795623924; bh=61Gx/lVAZ5B3jUJUljRnVPuQwlcQ1+TMpTHXRWWcjI4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bVbQB8CGOyCfdLJku0TJkZ8rxcYnsCyOlWHQVsNxZCPKJVOlK7FmjMx97tiblMIlW
	 spmEON5O1wGPo8ea5WI6HpVOV59Zn9DSNJg7LKzO4EdZaMFa7VynhzNS9ot4qEO1+d
	 BZ3FjM7pySm0bPsk/jI0daJkhS3aERAeIhLtNAjfHcINOBxYtZYXF2wb/hIy872E4+
	 becQ1Z4E4aoQk5Q5CF8lxpbHr4T5mkshvsPFqMBEb/WyAWwUxk+rvESYP0YjxdhNs6
	 x9WsexZMb7XmKt9oI9F5ejc2i2g4eCJMaiH7GLm5T/994AVbiO7+eoyWthwUF6Egfp
	 njy+8OcGUdUsw==
Received: from localhost (unknown [205.220.129.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 04877410DE;
	Wed, 25 Nov 2026 16:25:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-docs: Update book info
In-Reply-To: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
References: <20261114124813.1056807-3-manuelebnerli@mailbox.org>
Date: Wed, 25 Nov 2026 09:25:15 -0700
Message-ID: <87v75kx4ic.fsf@trenco.lwn.net>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Manuel Ebner <manuelebnerli@mailbox.org> writes:

> Update info about Lorenzo's 'The Linux Memory Manager'. The source is:
> https://nostarch.com/linux-memory-manager
>
> CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
>  Documentation/process/kernel-docs.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
