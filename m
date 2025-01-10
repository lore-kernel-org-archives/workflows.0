Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE220D4E1;
	Fri, 10 Jan 2025 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736512348; cv=none; b=Ih9Lu+/6SK0LaneDUIWGOnYSaPai8kNPf8m9W+5v18S5D7HjRl1Q0znz5kPWvDHC5jPnD6Jag6Ibfr/6WahYGDkydvHMZ8SaTrXVhai5ByXlxLOTU67VlFtKIs4g39zXPZPkyKkEq6+c9PMTO+hyr9rEHRLqES5QgjF5NURLb8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736512348; c=relaxed/simple;
	bh=bjvVQlcM4bFSsPXE11EEKQs+RuZA4XgPeYuFOqI3bz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgMGX83anGcoW3+p0wYX+PC0onBdTXwKYdhlFxL0RwQLr8N3q99/gWkhXnepilNEr8PHOQpXPVT9+KuckdCNhzrzMqFOYqYkJe0KyQhjkIDpk1v73ebhRApR3Q9mp1iUYKOV48HnT+ufvgB3sXAKcjJRAkQiGNVWFG65tWZtAoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k5qK/XC/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k5qK/XC/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E571C4CED6;
	Fri, 10 Jan 2025 12:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736512346;
	bh=bjvVQlcM4bFSsPXE11EEKQs+RuZA4XgPeYuFOqI3bz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5qK/XC/sdGOnWQ6BmuLTfu55pkxvqF+TEWzKkPf1ijqBQstf1A/tB/cBiT7jrzyG
	 kLOfEubzYXbsR79B1OZY46qlqMjXp1ZEf04R5F+/xhnRZE8oC3hh4k7rz3aH9n40DZ
	 c5wfbQjYyZD/LkTmOdtJr95Qv+4FFv+FffmYLD6s=
Date: Fri, 10 Jan 2025 13:32:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Yeking@red54.com
Cc: kuba@kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Theodore Ts'o <tytso@mit.edu>, Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, tech-board-discuss@lists.linux.dev
Subject: Re: [PATCH] Add short author date to Fixes tag
Message-ID: <2025011032-gargle-showing-7500@gregkh>
References: <tencent_6CF6E720909156A227D23AE8CFE4F9BA5D05@qq.com>
 <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_F8CFC8ED723F6E8103B4AF3D98D63D7F1F08@qq.com>

On Fri, Jan 10, 2025 at 12:20:09PM +0000, Yeking@Red54.com wrote:
> From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
> 
> The old Fixes tag style is at least 10 years old. It lacks date
> information, which can lead to misjudgment. So I added short author date
> to avoid this. This make it clear at a glance and reduce
> misunderstandings.
> 
> For example:
> 
> Old Fixes tag style:
> * Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
> * Fixes: a76053707dbf ("dev_ioctl: split out ndo_eth_ioctl")
> This will make people mistakenly think that "a76053707dbf" broke
> "fd3040b9394c".[1]
> 
> New Fixes tag style:
> * Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021", 2022-05-08)
> * Fixes: a76053707dbf ("dev_ioctl: split out ndo_eth_ioctl", 2021-07-27)
> This makes it clear that the newly introduced driver did not follow the
> existing changes.

Please no, you will break all of our tooling and scripts that parse
these types of fields.  The git commit id and commit header is all we
need to properly determine this type of information, no need to add a
date in here at all.

There's no issue with "making things clear" that I can tell, and no,
listing multiple fixes lines does NOT mean that a previous line broke
something at all.  It just means that a single commit happened to fix
multiple commits (which frankly is a rare thing, and one that our
scripts already have a hard enough time dealing with...)

So I don't think you need to add a date here.  Dates also really do not
mean much with commits, what matters is what release a commit is in, not
when it was originally made.  We have commits that take years to show up
in a release, so if you only look at a date, you will be mistaken many
times as it's not showing what came before what many times (i.e. we
apply commits out-of-date-order all the time.)

thanks,

greg k-h
