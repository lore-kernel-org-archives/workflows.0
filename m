Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D670809;
	Thu, 19 Dec 2024 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734572522; cv=none; b=ixxiQJJsyfA4RnSTm6sbuiZ7FffNIvhY/zuZmnOAgqH7JO5ykQ/M6HoUHw4YchTsZoY59UPl8/RwfjHs+TUIepdBPq4AW2RhgowNJLS0An2fvdrH9dizMjvGdFx5OHQ3SY6prqX4OZmsz4vhDEz2bANVbA6ojDvd4GjRV2CZTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734572522; c=relaxed/simple;
	bh=aWRuniCSqOPimypDT24mnho4Pd9irB2YTppR8yLwUc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRixFjuPzg2+2tRDxFO31ZTQYE5R9j420eNCaiIDk8WBfVela3ut7SVf37+/imwv4roZv539b1kebWytAApvrSCfNlxplb/7xGDGvPqDTAlh7CliqLQJCDP+JF29TxE1PwUz3cKkmVZdXkhMpkGeipbwmiRCKLVk1/LQzqBy5Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bONZwgPj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bONZwgPj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6248DC4CEDD;
	Thu, 19 Dec 2024 01:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734572521;
	bh=aWRuniCSqOPimypDT24mnho4Pd9irB2YTppR8yLwUc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bONZwgPj5rxYnVbHbFKZxkyofo5xrwR1J/ordzmMsqJuytvCn3xR2Lh2Q433pYvdr
	 Tz0D3cL4cRjGVFX2o0MGxUp5uzir5KYf9MNR4mm3BTXsk/LMxvwHYtH4FIrH/UwV6i
	 ZMJB76SUAbS6LYjK2cDr0OVaQoLCfJXuSoJmV24pnIpL8MEJdCDvtaHU2iTgj9etzV
	 zsE642dp6xMr0UZoXPS+T4xsXwbh6PguMG6jI2ggn+vIw3uTmuod5nib4YnRiMUjFw
	 UNUMKi4MBG5hYSXLVIU5eWBMXnFLF4QTnSPB9spw+fBEcPCx3GlkEA3zJeM4QzRqb0
	 WN5Ju+sNjmXyg==
Date: Wed, 18 Dec 2024 17:41:58 -0800
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: torvalds@linux-foundation.org, apw@canonical.com, conor@kernel.org,
	corbet@lwn.net, dwaipayanray1@gmail.com, geert+renesas@glider.be,
	gitster@pobox.com, horms@kernel.org, joe@perches.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux@leemhuis.info, lukas.bulwahn@gmail.com,
	miguel.ojeda.sandonis@gmail.com, niklas.soderlund@corigine.com,
	workflows@vger.kernel.org
Subject: Re: [RFC] git-disambiguate: disambiguate shorthand git ids
Message-ID: <202412181739.0170E86E58@keescook>
References: <CAHk-=wiwAz3UgPOWK3RdGXDnTRHcwVbxpuxCQt_0SoAJC-oGXQ@mail.gmail.com>
 <20241218233613.219345-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218233613.219345-1-sashal@kernel.org>

On Wed, Dec 18, 2024 at 06:36:13PM -0500, Sasha Levin wrote:
> Sometimes long commit hashes can be ambiguous even when providing
> several digits from its abbreviation.

For testing, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/log/?h=dev/collide/v6.13-rc2/12-char

>  scripts/git-disambiguate.sh | 163 ++++++++++++++++++++++++++++++++++++

sfr has a bunch of logic in his "check_fixes" script that we might want
to consolidate into here. I have an updated copy here:
https://github.com/kees/kernel-tools/blob/trunk/helpers/check_fixes

-Kees

-- 
Kees Cook
