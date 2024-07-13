Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71A4366;
	Sat, 13 Jul 2024 00:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720829159; cv=none; b=OT5QN56Ks7ZiK+MV8unIhvXIRcdrVIRzeV6O9gKincjVW+LL2UuCIRJe04iCwxlUOPer98F+ArCBbbhXEuv3X8HLOHZRMWT5Y5OiD0E5mnhX4U1PpkqSvsYqIGT4G6jdVBn7j929cjHHtUKWcyhE2l1tVkUn2bx6/xviGbTQ8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720829159; c=relaxed/simple;
	bh=KTYMKskYmrbxzsMDgjA0fsDpGo0vfOMLMWERjgxesEE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XnqXwJ76Hp4RmcsbnH0fIAeK8QFoCfLcNoS0MYX/QV79nqOHMVbpa1rYxgba+4+qQYZJ1yLagBrv2LyKn+qyFIELSTNf2DcyFLXW5yN2h06Symp5E7Sz9InIa+rZy2lq7zMlX9QnXVTxAA1xZQSTwM2PJoiuCKizgvVmTu2VFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uskpJoVO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uskpJoVO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034C1C32782;
	Sat, 13 Jul 2024 00:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720829159;
	bh=KTYMKskYmrbxzsMDgjA0fsDpGo0vfOMLMWERjgxesEE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uskpJoVO5rzSaupq12ihXT9jS6dFICgpSyt3toCEJsQZ4a8JoMVA+66vBC3MaOY3A
	 yiiK941sYIWrqi+Am6NOSWWVcHN43qyhMnmp9qQtkKdvPoAJHnknA/Zi00cwe0dIDa
	 XAhLQlAzC2POYfiUyMhMV2UIeMXEsicl+NMjexDmJGHjZJRAxdVmC9D/bZQfB46vBY
	 bw0pPRbSWP3UCVY3nb9vbBYi+zEnyhoRHrjSWQt7WzNbC3nZTDTo+6HOCGGqeyea5Y
	 Tdv382K2Qd4FkyBvGlZ0/I7R2HSRoz806c+5Kykymn4goVcUxnMBhKEGXdgYtyyvgg
	 smMBCS4r2RQFA==
Date: Fri, 12 Jul 2024 17:05:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: <corbet@lwn.net>, <workflows@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs: maintainer: discourage taking conversations
 off-list
Message-ID: <20240712170558.50c89238@kernel.org>
In-Reply-To: <669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
References: <20240712144903.392284-1-kuba@kernel.org>
	<669179424b589_1a77429479@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Jul 2024 11:43:14 -0700 Dan Williams wrote:
> This reads as a vague ambiguous quasi-threat with no actionable way to
> enforce it. In contrast, successful maintainers already have a sense of
> the benefits of pushing discussions to the list as much as possible.
> 
> For new and growing maintainers, which I assume are the audience for
> this guidance, that are unaware of the pitfalls of taking conversations
> off-list, they likely need help understanding the *benefits* of open
> development.

I don't think so. If your boss comes to you and says "Dan, from now on
try not to reply to customers on the list, open a ticket first and only
reply once tickets is resolved". Is it more useful to you to be able to
extol the benefits of open source process; or to tell them "this is not
allowed, here's a link to a quasi-threat"?

> So if this goes in as is, so be it, but it feels like a missed
> opportunity to extoll the virtues of open development. The benefits are
> in the same vector as the "release early, release often" guidance where
> the urge to polish a solution in private is a common trait of newcomers.
> Lets document some tribal knowledge of how one moves past that first
> instinct.

Hm, the disconnect may be that you think this happens with maintainers
without upstream experience. So we can train them up to be better.
In most cases it happens to folks with experience who are good
maintainers. They just get 2 orders of magnitudes more patches from
inside the company that outside. Then a contribution comes from outside,
the maintainer is overworked, and tries to shoehorn the patch into the
existing, internal-only process.
