Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAB615383E;
	Wed, 18 Dec 2024 05:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734500935; cv=none; b=BKjDP4F2W6fRftZqMau26530pZe1M94w4iafMrKWbk9M7+BIKr63Jkn5WxuSuMr7Z/Yn9eE+n5h4+sAU0ywRTifLPpBpT7DuqQh6qmRUd5gUB695Y4jiCceNYNMirSo+d0F2vXAcDViGxzeouOkeyL3xu/+do0MNmPAb+wzVFIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734500935; c=relaxed/simple;
	bh=NfOzcv2g2e22rFhh5JdjNDAg7xnFUQiOwMHTqgGfvww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJdVE0V6++y6QApCZtYZDMD/QSajx5D1E2/WCVft9ulc2+ekoR427OsWAKank+OrL/a/WkIK3tld6ZAr1VKXIXKgAtLRjNQN5QvrlKpa+7if8PpLYT71QIOdtk3zNGV5GUM6jhDYMkw0e9HoAmGRRLMxvf0iIP8asYhG1CLkHrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DakzdjZs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DakzdjZs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3683C4CECE;
	Wed, 18 Dec 2024 05:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734500934;
	bh=NfOzcv2g2e22rFhh5JdjNDAg7xnFUQiOwMHTqgGfvww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DakzdjZsMFD43Uo8hVb9nBy6z/CFsx+GcsCYypcgDxlKzOJmBV4rmchNglfzF+Cb9
	 3zli7HQYXcn9F+VRyEzbYDeWrn22GPdfBTqy4WV/904kSsvaJXj6/T43OXMYbXLRgv
	 mcsmzrnTc7Y9WvTPQY0j5RVvsgqxRaMASuyVYAz7Ic8JgmzsaVsnA3H43QX5BTP729
	 tU4v2yzcPVKyZzjG3BSRs1mFO01nY6EqXeEQ7fcqntWoDMGrG4K91Kl1ufW+n2ofZL
	 Sn8TvcnbE+0B1Av7i0pqyho5syvLHkqqiKgRJ2LltYh0kpvOsZlmaApV1il+4Ppyeq
	 Wjkwv+wNZq7dw==
Date: Tue, 17 Dec 2024 21:48:51 -0800
From: Kees Cook <kees@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Joe Perches <joe@perches.com>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Thorsten Leemhuis <linux@leemhuis.info>
Subject: Re: [RFC PATCH] get_maintainer: decouple subsystem status from
 maintainer role
Message-ID: <202412172145.78ED0178@keescook>
References: <20241213112921.180978-2-vbabka@suse.cz>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213112921.180978-2-vbabka@suse.cz>

On Fri, Dec 13, 2024 at 12:29:22PM +0100, Vlastimil Babka wrote:
> The script currently uses the subystem's status (S: field) to change how
> maintainers are reported. One prominent example is when the status is
> Supported, the maintainers are reported as "(supporter:SUBSYSTEM)".
> 
> This is misleading, as the Supported status defined as "Someone is
> actually paid to look after this." may not in fact apply to everyone
> listed as a maintainer, but only to some of them.
> 
> It has also been confusing people to what "supporter" means and has
> required updates to the documentation [1].
> 
> Thus stop applying the subsystem status to change "maintainer:" to
> anything else, as maintainers are maintainers. Instead, if the subsystem
> status is not the most common one (Maintained), indicate it as part of
> the subsystem name. So for example, instead of "(supporter:SUBSYSTEM)"
> report "(maintainer:SUBSYSTEM [supported])".
> 
> [1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
> 
> Cc: "Theodore Ts'o" <tytso@mit.edu>
> Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
> Cc: Thorsten Leemhuis <linux@leemhuis.info>
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Reviewed-by: Kees Cook <kees@kernel.org>

> ---
> I have been confused myself in the past seeing "supporter" and have seen
> somebody recently wondering what it means as well.
> 
> I have read the threads from 2022 that in the end resulted in adjusting
> documentation only [1]. I very much agree with Ted's points about taking
> the subsystem status and applying it to all maintainers being wrong [2].
> 
> The attempt to modify get_maintainer output was retracted after Joe
> objected that the status becomes not reported at all [3]. This RFC
> attempts to address that by reporting the status (unless it's the most
> common one) as part of the subsystem.
> 
> The patch is not perfect, as with this approach, the logical thing would
> be to do the same also for reviewers and mailing lists. In fact,
> subsystems with a status of Orphan typically only have some catch-all
> mailing list and no maintainers, so the "(orphan minder:SUBSYSTEM)"
> would never be currently reported by checkpatch. It would be thus
> logical to report the status in the same way for lists (and reviewers).
> 
> But I didn't attempt a full implementation as I'm not fluent in Perl and
> would like to see if we can get a consensus first. If we do, I don't
> insist in this particular "SUBSYSTEM [status]" syntax nor on
> implementing the full solution myself - I would be happy if somebody
> else did. My main point is that maintainer is a maintainer and the
> subsystem status should be indicated for the subsystem, not for the
> maintainer.
> 
> [1] https://lore.kernel.org/all/20221006162413.858527-1-bryan.odonoghue@linaro.org/
> [2] https://lore.kernel.org/all/Yzen4X1Na0MKXHs9@mit.edu/
> [3] https://lore.kernel.org/all/30776fe75061951777da8fa6618ae89bea7a8ce4.camel@perches.com/

Do we want to change "Supported" to "Funded" to help clear up the
meaning? (But yes, I agree, that the subsystem status should be applied
to the subsystem, not the individual contacts.)

-Kees

-- 
Kees Cook
