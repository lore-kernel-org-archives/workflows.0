Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C62BD11;
	Tue, 10 Mar 2026 00:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773103700; cv=none; b=tZgCHlFG3cjHjKKpTRM226tOocSMTti9IB7i/BBEWra6kQu2E7PhdLnLPJOa8BqOpFnw3t0ELWEXr4q+3GPpaLyNUYQiD+HeFOcyDYRXWsycqVhUBOwW8CwaMHKLEgcsW2tUaD52iozIbfT4f2MhvocYuAJEKqROP0ZQlUCbITI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773103700; c=relaxed/simple;
	bh=dPdpyLhsXPRjAJY7V8wT6OtM6easdvUdumvPwskxSjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlNBn49ORPiz6fIEsOyQvy+YvG+NQB17zfSN0beBvplf5XwSdRF4az40AOAgWrvK6dsPRrYQhO16mqZHu31s2o980K+IAzuSutZu/2nLTJ1wXgbXdwageiHLw4XOml0ofPyY1HNtFqpDsOetmrUP98Jq81I/0NErTkwP9QFVO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWMns5zi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWMns5zi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5259AC4CEF7;
	Tue, 10 Mar 2026 00:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773103700;
	bh=dPdpyLhsXPRjAJY7V8wT6OtM6easdvUdumvPwskxSjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OWMns5zilMr8+kWUQQ5b2KlrArR5O6TFI8VDKUz9WnC31WqbwIWav/hwtMp/iRL7t
	 M+FcxhE8WFIucasVxf2lOTwNU0nknHFko0jXcUa+t8IhWmVGec3Rvo4ejhlaFopSO0
	 3ZsYFILZnSfI4DlZqoehWVqbhOqBHTA1VFkry3OX8wmh9sZK/rxm98jxsoJY1Z9Fic
	 mTXtyMfaRLmkr+HM1gcQLWOk5AuKDm1VvhLoW8+k5g0bvooyDYabBECEsCVek6s3iy
	 VMOvGZG9IpvedF340qGTWgSEaes5qC7XQHm81/1V7RsxAHPXUkc2uUu3Or5cT8IQpH
	 Y8A/2fkL/oUsg==
Date: Mon, 9 Mar 2026 17:48:15 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	workflows@vger.kernel.org, automated-testing@lists.yoctoproject.org,
	"kernelci@lists.linux.dev" <kernelci@lists.linux.dev>
Subject: Re: Hosting first-party kernel.org container images
Message-ID: <20260310004815.GA3293460@ax162>
References: <cc737636-2a43-4a97-975e-4725733f7ee4@gtucker.io>
 <CAL0q8a7mepGUdgrLsQhCUdLVP8VcxB9x_oBRCWAYNeoVAUb=7A@mail.gmail.com>
 <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78adef0e-81b0-47d4-be20-32f42ab8ec04@gtucker.io>

Hi Guillaume,

On Wed, Feb 25, 2026 at 03:44:13PM +0100, Guillaume Tucker wrote:
> This boils things down to a few practical options:
> 
> 1. treating TuxMake images with kernel.org toolchains as the de facto
>    stardard,
> 
> 2. creating a repository from scratch on git.kernel.org with
>    independent hosting for base images,
> 
> 3. some middle ground to be defined which would remove the risks
>    associated with third parties without duplicating efforts.
> 
> I feel it would be good to have more maintainers' feedback though.
> 
> Nathan, Nicolas, Miguel - what are your thoughts on this?

To be entirely honest, I do not really have a strong opinion here. I
generally agree with your thoughts around branded container images,
although I do think that TuxMake's images tend to be fairly lean, so
those easily could become the recommended images without many downsides
aside from maybe where they are hosted and how they are maintained.
Having a clean set of Containerfiles on git.kernel.org does not sound
like a bad idea, especially if they would be structured in such a way
that other entities could customize them for their use case further. I
guess its usefulness really depends on the other stakeholders like
KernelCI. It seems like there has to be some sort of buy in from the
kernel.org administrators around hosting built container images
somewhere on kernel.org though, as I don't think the regular developer
is going to want to build images locally. Not really sure what that
looks like.

Cheers,
Nathan
