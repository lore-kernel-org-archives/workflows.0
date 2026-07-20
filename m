Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91E3330B07;
	Mon, 20 Jul 2026 19:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784575197; cv=none; b=KrmJCbQoonGzrKwqqwxabTrZllx+edyecd0WBj4zGkgSUz1mO0u514Hvgqw0mYt21NQyoAbCFhqYFLv/OT/26ODmohklaQzAMDwAmyhkADMNqGHoSV4VXywLboK1Eg3B3Px2+d5/lztDHxfGB8DEk2uO5GuQokWVYpcye5XINxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784575197; c=relaxed/simple;
	bh=hmwmkX1BX0HruXFZTSS7lSbcdC8sE9JdgleAqBRCUvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TfTAAXBEQL4RBekoyXEohiEhSNkO4ly5hc3XFXRhGpeghcoHP4STvSSIIQGU/IDWFObbhOHYUTbD1waXZKLqnUyhdhsaBu4k31EVaCASt/ssmsL3ZdmD5MT69B9ExCWWsrd75movWzzpOhavcDGVPCTldCElNvL54w0fkB4eRkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Lwj43FOG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Lwj43FOG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 56A57408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784575189; bh=YzdW24YFvFqCwtOIz7jJb5ImayKcIdNLt/DSNV4KBpo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Lwj43FOGj2OdKbczXN3aCSu0f4YcI2RuWSSaDxkZVLNKm7xWyjht+MsTPEqcgq6g8
	 phrQceNbGXtI7hXsb5PJIdvkql6oYdB6KxFc9lCnNopMTifiIH73IBIlrC7a77A7pa
	 3fuI40wKXaw5t+5Q3DvZ8gl6ws3w94dxwViQRjs3W2Gw57IGr+Fq+2CHYHyJm0lMRG
	 f6jA667/c9ZEO77vboMnpF/R0S92X6giOBh5B2et9ZBwcA1wLri1qo73mi0u1nuB6B
	 QnY0ujvBIFTUH/RA58W2zD2cXaSYybemlIWKLVO8g+VIiJFcMe63TolENTIRL5ug3Z
	 VlCAH4XUUumfQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 56A57408B2;
	Mon, 20 Jul 2026 19:19:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Saravana
 Kannan <saravanak@kernel.org>
Subject: Re: [PATCH v3] docs: dt: maintainer: Add Devicetree and OF
 maintainer profile document
In-Reply-To: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720184040.9870-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:19:48 -0600
Message-ID: <87y0f531uz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Document how Devicetree and Open Firmware maintainers handle their
> subsystem, especially focusing on two caveats:
>
> Devicetree subsystem handles patches with a minor difference comparing
> to other subsystems: while DT maintainers pick up OF code, they only
> provide review of DT bindings without applying these.
>
> All three DT bindings maintainers rely currently on Patchwork and due to
> enormous amount of emails per day, regardless how much DT maintainers
> try, they cannot read all the emails.
>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Saravana Kannan <saravanak@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> I expect patch to be picked up by Rob, after review.
>
> Changes in v3:
> 1. Add also F: entry
>
> Changes in v2:
> 1. Correct typos and trailing white spaces.
> 2. Fix order of P: after C: in maintainers.
> ---
>  .../process/maintainer-devicetree.rst         | 70 +++++++++++++++++++
>  MAINTAINERS                                   |  3 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 Documentation/process/maintainer-devicetree.rst

You'll need to add this new file to index.rst as well.

Thanks,

jon
