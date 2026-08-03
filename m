Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A322DCBF4;
	Mon,  3 Aug 2026 20:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785788811; cv=none; b=RyNkA1qoDBu70uPKjrC8ogNQY1WStF2+jcnyp24PF7rPKPHUna5nma6nIdZjKCq5cT0s0OPZUqHI2URjfhaZTgMy/J2JX27VI+jRdKvpO/c7Trozpfg09jSIWh2kT5HWmThqq0h3c3MdASUIoHdhPf5flJKjI8YxeU7UY2KVEX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785788811; c=relaxed/simple;
	bh=xSaDOAZN6xTgVKBCwzA+v6zyde7tVAYo4A3vWn4P7Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lW/FpjWb4pUq80QxNmVUcUCAs5s1Y5ZllJBnLAtOZmEVxhfCTHJchpJCsBCUrebUz8ZjHfV9jwCb6CXkFFGAIR1gFr5ayKGUk3iqXwXRAUlILKn1TErWz5ZyCu4wnwnWcEWZKrCXz+B7tBuo6WaqGdTBPSNM+AMPBmwxqaXdwjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjLYpBUf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjLYpBUf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965B01F000E9;
	Mon,  3 Aug 2026 20:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785788809;
	bh=R1P62nhGAM0hZg4XQd9r59zaBc0TW3sOl54YcUwf5LA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BjLYpBUf9NMg1irLa9HdsiWnzLupZRXHa/qDpUO43oFxly7Q1L4lmroMtbeZCoMnj
	 v+Q1CefnAlP0MR/0AWOyS1lOEcNXlGtkwd4N6bomyb3qX4xmzM7XTTGUwvTsf6i0dd
	 2VIq2Zz6YQcQiq0jFIh///O2oNiGsoGofR0qaVsLbU7KuMXTOMi6KaWSvVgGcl8mi7
	 0Tz0dk1CTBERnSnr5ABM2ldK5i4aaY4FcfiDSccs310T06LlRt2PTVStKsl4ek4tf8
	 G+HGIj8zTq5jeyUxODiRKtMddnFxB+3WJBe9QtIU+oJZfeprvNDPO1R23qe/xIC/MT
	 PtmZ4vemUeS6Q==
Date: Mon, 3 Aug 2026 15:26:48 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4] docs: dt: maintainer: Add Devicetree and OF
 maintainer profile document
Message-ID: <20260803202648.GA393707-robh@kernel.org>
References: <20260721060916.12465-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721060916.12465-2-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Jul 21, 2026 at 08:09:16AM +0200, Krzysztof Kozlowski wrote:
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
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thanks!
