Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81612FB3A;
	Mon, 26 Feb 2024 19:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708976632; cv=none; b=F40y54iuPTvk3RtSDUvAanorvwmCPfMf6F2p8FfPhhB8iXcIB5lmo/l6NBWcAMo1SiMeJ6CwR91GGMmWjnabiyMxj4M34IOrXsmyL+dt8pde7KFXUKrY9PQxFqE9fjmkbKCnGTfvyu7j4W4ZC8nTDMZ8xAUJtWbr9FIgUeG2aro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708976632; c=relaxed/simple;
	bh=ZUkiGzwhHqXGuxRUnLuubU/TgUFKBxvEO4O9ipNVgIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1h6Q3/UjqY4eSFIg6fy2ymJB5YeENGatln2Kd98FZUwV6bg38I66bqK7mCgKQYcByjowdsv3Y0GJRj/Qm5+P37W4jBtJWKKz2b5j6zy9Z4pShPPU1eUlDYiBz+5jRrk4SbEPumvWpjtTWEKfT9yQRKLSX6NAQtLACKmFXBf4Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XsGf8pqm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsGf8pqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BF6C433F1;
	Mon, 26 Feb 2024 19:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708976631;
	bh=ZUkiGzwhHqXGuxRUnLuubU/TgUFKBxvEO4O9ipNVgIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XsGf8pqmB+muWuhS/63vQAnbueRgPgftNF86lqTMsx1GZE4s6XoKyaSIqEhM7Oynl
	 00Gf0Tkz7oPtlEMZuANc255sA1Cf0YJA+Qn0HBpK0qYV8AzC4DN5NVXoI3qZIX9wty
	 mODRFClMKhiV/q5f/GXBx+CFDO0QE6sZpg9FKCoeQYjAR8+D0YMh/F8mOamkHH7tTv
	 qb3mn27NyyNUtd0wEFM9XSL0NrqaHnrk0Irrsl455f1ILeWMOO9yfKPGdFZDJGZZWK
	 Be3AbArc3H8XQug9UGhMEAi5jZO5zeTOMOyQN4rdi54GG8icBa0OZs985Z6E/Wyqaq
	 lNDURPPwcdkDw==
Date: Mon, 26 Feb 2024 11:43:50 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: workflows@vger.kernel.org, corbet@lwn.net, ast@kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: Simple analytics for docs.kernel.org and patchwork, please?
Message-ID: <20240226114350.215be672@kernel.org>
In-Reply-To: <20240226-gainful-dark-snake-c15cf8@meerkat>
References: <20240223083154.4fbee63c@kernel.org>
	<20240226-gainful-dark-snake-c15cf8@meerkat>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Feb 2024 14:24:39 -0500 Konstantin Ryabitsev wrote:
> In general, my previous experience enabling libravatar on git.kernel.org has
> taught me that many very vocal people *really* don't like to have any kind of
> statistics gathered about them. However, if it's just for docs.kernel.org,
> then I don't think I have specific objections.
> 
> That said, I would need help turning this on -- if someone can pass me along a
> Sphinx configuration option that I can enable during build time, then I'll be
> happy to add it to our build jobs.

Excellent :)

Let me CC linux-doc in case someone can tell us how to hook things in.

Could you give me a ballpark number of page hits for docs.kernel.org?
500k page views a month should be enough? Plausible has different
pricing depending on number of views, I need to know how much money
to ask for.
