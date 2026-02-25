Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E871E5B7B;
	Wed, 25 Feb 2026 23:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062047; cv=none; b=Dlchn2/4JdqUYXqfmKH/0ICmMoP2qLFwZFuYi9ohJUpvB3XeqBmNaSJGWD5wzORbPsNAi0FPMuWgll23l2cIaVyryIlKTL1aU3EONCRMvdhFQ6B2AoD5UFllXNmi1hazWhz5Y/DvkH60uaQXs8zyJWMp4JiPBo3msSynLQqK7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062047; c=relaxed/simple;
	bh=3VNbaysShoLa1xcRFuaw1Le1KLowDxdboi+vQrl4amk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbxAqwqVZ9O3ppV+gRhpMJoZA6PZNMpBEYwS4q0ywVlbixio0PfdB+IGuLNIbf7TrwSdAaB2ND6fnktYQZoyXYqAk42EAGWoqW3nfnobZotOCMPC3O+06dUjgcBPctfFuNYVgAEb16bY7DnQZp+4/nCUxDennY0Y8NQOisa9/UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WabMR5Ig; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WabMR5Ig"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67649C116D0;
	Wed, 25 Feb 2026 23:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772062046;
	bh=3VNbaysShoLa1xcRFuaw1Le1KLowDxdboi+vQrl4amk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WabMR5IgbhKo6p9XoS+69tVkGcWROYQW4aEpfjiABBoDjKn9ebmMsE1qcVwIrM0i/
	 0z/cOKGwg7FulViLJqqbNpZ6l2wNmhTKle6qVMn2xkhH/e3RYSUJ/8PEFUhb/sd6on
	 5XYp3n0PHiWRSMy9gZcVWM9Extg+lo06PEFvblmHb1hbugjRBfiWyR9073ZaiMP4CL
	 R1iraR1CiLzMEXEGA5Lbf1oOPdoAvWqbmiKDwVoLiNhjJ8V4E4TfN/ennQnEROM2Ta
	 xvIBTVrX2HVDn6MUFrNhVFFGnCUZExvCeXUT3PRlzEl8yVSzZN4/VdyRGelUU2Lcbb
	 2wDgygRuryFSg==
Date: Wed, 25 Feb 2026 18:27:25 -0500
From: Sasha Levin <sashal@kernel.org>
To: Alejandro Colomar <alx@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Message-ID: <aZ-FXZX0bgfTjXyg@laps>
References: <aZ4_sBIy8rOUL59Q@devuan>
 <2026022531-tightness-rare-6a14@gregkh>
 <aZ87Z24f9HZsofGl@devuan>
 <2026022539-commotion-huskiness-8736@gregkh>
 <aZ9p2RMrJL1mQ10w@devuan>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aZ9p2RMrJL1mQ10w@devuan>

On Wed, Feb 25, 2026 at 10:45:48PM +0100, Alejandro Colomar wrote:
>I appreciate seeing the date in my Fixes tags elsewhere, as it avoids
>looking up some commits, which I would look up if I hadn't seen the
>date.

If it's something that is helpful for you, just add a git alias?

$ cat ~/git-fixes-date-filter 
#!/usr/bin/perl                                                                                                                                                         
# Save as e.g. ~/bin/git-fixes-date-filter
while (<STDIN>) {
     if (/^(\s*Fixes:\s+)([0-9a-f]+)\s+\("(.*)"\)/) {
         my ($prefix, $sha, $desc) = ($1, $2, $3);
         chomp(my $date = `git log -1 --format=%as $sha 2>/dev/null`);
         if ($date) {
             print "$prefix$sha ($date,\"$desc\")\n";
             next;
         }
     }
     print;
}

Add to .gitconfig:

	[alias]
	        lg = "!git log \"$@\" | ~/git-fixes-date-filter | less -R #"

And then "git lg" will do exactly what you're asking for:

$ git lg -1 origin/master | grep Fixes
     Fixes: cc1e127bfa95 (2022-05-09,"random: remove ratelimiting for in-kernel unseeded randomness")

-- 
Thanks,
Sasha
