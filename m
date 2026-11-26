Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704945;
	b=fzElpEw7M4IzF9JWdl6qNh5z+ON6cB2+EtXiI3uJpMqykJfUpi+cQrMwH16ne0JqcUJV
	 e3KB/aEBUiYwBbG0zfSi6pKsKVX1YcHZ+mFxkYqK4eBZ3sxUAUpjiDlhdo9eH+yy4Qq8K
	 J3nTm38N/fu58SEzY2ghPhDLzm4mvGoCdicsqYfeV5H5sN/XQEF0oxXicAbWiU+vBOFrt
	 Jg2EzMR+9YmXqiGu5MTG8Q+bI9zZj8ib8fUtyQAX8Kcy+1nCw/o3H0kqMb/NMfS6cUzDI
	 Ul72PLnSSKtWD+n/gVoFdStKkWzR8wuiouBvfKaoG1AQ4XPztlZmnR6BRLG4DE6Oxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704945;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gNpU21ZWUiHpMFkWQ48piVkXt/cRxdpLpRnLeAHgyoI=;
	b=AsfXsUeOfFqw9QPM0F2t8niqesXaglT2xVU8yc25RUZksZuYO2OLgzyW+BDylZpGbxY5
	 OS4JjnzxHle5Nz9zLxleK/Le7cuk1gP1Aqiu6A8S7SfuQifwdZnJWb3DTWmx19IzdWb/b
	 +GtIeaQCcTtXB4dxFP1ltGWkMYf07Gim6pwQLGbuc8OX+1WLDbInicI6/Z96n57UoNQ/5
	 5LBkvRlcR48zCk/V4ek5ZBq5zyJAg45AkRPMuvqs8PKtULhg981akwF+ES12qynrsPjR3
	 QUJz08/DK7YUOeRTkqD/HCGdeHWGQAKmgFtPyXxwNbbhO1b25+2rhr//AJTDoWLzg4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cHZrqLpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B32606A31E;
	Thu, 26 Nov 2026 14:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cHZrqLpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF001F000D2;
	Thu, 26 Nov 2026 14:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795704944;
	bh=gNpU21ZWUiHpMFkWQ48piVkXt/cRxdpLpRnLeAHgyoI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cHZrqLpKus9VAAECABKx0U6mZiBK6w1+ssC+3mrViB9MQer40IOzq+lvm58sAmbQY
	 W5NgV1GU5/oWjhwrarmIIZrAYVKnjJ8JdguLgIjhVPUHjtPOHGrvjAOLURBX8QvaF9
	 bj3jqqgEqIaEPJxbwNG8e8RgnNOxOCv6ZuqwfxqcUC2mepK+KQC75KPP745bCwu4Ys
	 iQ8of56zeJPUjNNmpKGmbiOX3R388FUjxLintw/xm+lSH3QrMINZq3C+SVjhnBQb0W
	 7DXpJhC26j8JONLKpR0JfShcgllLR2SudJkMi/h4hqLjjEUj5G62Dc310Cnk9MCQdj
	 COlRIH45cJXdA==
Date: Thu, 26 Nov 2026 16:55:41 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] docs: submitting-patches: Limit backtrace trimming to
 timestamps
Message-ID: <20261126145541.GS774860@unreal>
References: <20261126-backtrace-timestamps-v1-1-0a645b25e5ae@kernel.org>
 <d4848afd-a23a-4119-ac09-1fe5e4681e3a@sirena.org.uk>
 <20261126125959.GL774860@unreal>
 <00561b8f-c85c-4cb4-82dd-aee3d14e509b@sirena.org.uk>
 <20261126133042.GM774860@unreal>
 <8836d5ee-b800-49e3-a866-327041384b40@sirena.org.uk>
 <20261126144740.GR774860@unreal>
 <b8f8e83a-10f0-4aa9-b850-adc0fb23e7f2@sirena.org.uk>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f8e83a-10f0-4aa9-b850-adc0fb23e7f2@sirena.org.uk>

On Thu, Nov 26, 2026 at 02:51:15PM +0000, Mark Brown wrote:
> On Thu, Nov 26, 2026 at 04:47:40PM +0200, Leon Romanovsky wrote:
> 
> > I can try to work around this using the maintainer's profile, but can we at least
> > agree to remove the example from the documentation? It does more harm than good.
> 
> Yes, that is quite outdated.

Great, I'll send v2.
