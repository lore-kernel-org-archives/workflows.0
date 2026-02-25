Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D742C08DC;
	Wed, 25 Feb 2026 20:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772050118; cv=none; b=RKvMZOf8leVEx1ja3I3ip0pvWdoNb2I5pHRZQAqctOb+eB2OIgGlYXQL3WjvXIIuOs/JSVFGXnYXtVyeOOzmTDPZNG5aCEHdisCic5DStikCbReclvjaVUXfYHE3f+pWU/wR9tSMte2CaL5I6Qy/y6kNO1JS4IzDepDZ7zkDZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772050118; c=relaxed/simple;
	bh=86dqlcvbOLBDeTMMrtDpDc22K0LB/8xf75EiqJsjoCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8N6fpHU7keF8k0vQoyGXbEV8SX/a5EeGGRpjiazpkBV9ixvFqIGfOaOkcaAWgOR+bJzajdaq+A62SJ3eA78716QwKDscYXJhckF4rltvGCtkS+15yz3MV7r2UMuYix6Cn9OjNUqVtW1xJlsOrKBmfQW7LUmcrfdCuHgX/02J9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hd0Q9L9k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hd0Q9L9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1529BC116D0;
	Wed, 25 Feb 2026 20:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772050118;
	bh=86dqlcvbOLBDeTMMrtDpDc22K0LB/8xf75EiqJsjoCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hd0Q9L9kLe6cPUWoa+b3llAsp7WD2934EpGeDaGaMHrBErpmvCcttbGfBR7bGLsSX
	 yEzxVQgY//5RH/r0/rStWSmuhplfcU6dTFAKeqMSO1wurDvYlnlRVPxaksMIO3obBV
	 TFd89AhCt27i/Gu0pbP+OFqlmKHVyaFoRCJUjzJMvqvEa3SBHAHis7+IlJtQI3AfLo
	 4+QGi+gAj/eEYRkwh0vEaCMAbz4EkeNxCAoFMCWhwuvQfctJARHtxYtKqcNjk9Sace
	 WUykEe60gZJoDlN3ZweKiFLU9BIla2nQDFW8awV2P1eZdeItSEoIm5U4mK0dE2GzFy
	 kcbZhOov9T3vg==
Date: Wed, 25 Feb 2026 15:08:36 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Jacob Keller <jacob.e.keller@intel.com>, Yeking@red54.com,
	kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Theodore Ts'o <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <aZ9WxFBEBub9uOS1@laps>
References: <aZ4_sBIy8rOUL59Q@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aZ4_sBIy8rOUL59Q@devuan>

On Wed, Feb 25, 2026 at 01:56:02AM +0100, Alejandro Colomar wrote:
>Steven wrote (Fri, 10 Jan 2025 08:03:31 -0500):
>> How can it lead to misjudgment? If you have two or more hashes matching, do
>> you really think they'll have the same subjects?
>
>The possibility isn't zero.  Statistically, it's quite low.  However,
>it's non-zero.
>
>$ git log --format=tformat:'%s' | sort | uniq -c | sort | tail
>    248 Merge branch 'perf-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>    263 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-2.6
>    275 Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>    293 Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
>    314 Merge branch 'akpm' (patches from Andrew)
>    315 Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>    318 Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
>    324 Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input
>    369 Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
>    670 Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
>$ git log --format=tformat:'%s' | grep -v ^Merge | sort | uniq -c | sort | tail
>grep: (standard input): binary file matches
>     22 drm/amd/display: Clean up some inconsistent indenting
>     25 Auto-update from upstream
>     26 [ARM] Update mach-types
>     26 pmdomain: Merge branch fixes into next
>     30 s390: update defconfigs
>     32 tools arch x86: Sync the msr-index.h copy with the kernel sources
>     38 [SPARC64]: Update defconfig.
>     52 mmc: Merge branch fixes into next
>     59 drm/i915: Convert wait_for(I915_READ(reg)) to intel_wait_for_register()
>     62 batman-adv: Start new development cycle
>
>Subjects repeat every now and then, and the entropy in some subjects is
>actually quite low.
>
>If you include the commit date in a Fixes tag, then you preclude the
>entire possibility of a commit reference clash, because you won't have
>two patches committed in the same date with the same subject and same
>hash (unless you *really* try)

The probability of a collision where two commits share both the same
abbreviated SHA1 and the same subject line is so astronomically low that it's
not a realistic concern.

For context, Linus himself pushed back on merely extending the 12-character
SHA1 abbreviation to 13. A change that wouldn't even break existing scripts.
Yet the proposal here is to introduce an entirely new date parameter that's
incompatible with the current format, all to address a scenario that is
unlikely in practice.

-- 
Thanks,
Sasha
