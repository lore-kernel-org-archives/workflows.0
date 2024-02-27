Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4550754664
	for <workflows@vger.kernel.org>; Tue, 27 Feb 2024 22:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073158; cv=none; b=MTc2J8JptE6vJbzQNr8nFsAR6kXBk0WIbqyTLDzrA7AS+7rC/szONinTzPxBLYNVCRZ96LQf/GffnYhlsNplRRU8NorgWhuKpl0OxJTx+lVKSQeoBk3oJ/nxebOAH6TLEs80souixb4CynZfGbTog4hAkGzFgrasIGnF9QZVYM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073158; c=relaxed/simple;
	bh=rpVNrVlxcl6g9cMUAeG0cQt/e1FxeJkvZS/bhGYlG3o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=toTSbtqoFGrW7DkjiV3SspUlyuG5xXSl201uzYfgu8y0Fwrycon4rxWgwV9puXfolGi1pvTrO9tjYt2jIH2jDFF2vAfVLpg5qwlKZglidX1kGG0Z6WVzMUZtkYxo74GK0sT8euW+fSSimULxvRaGQOOZLd1AaTaR8b+Y9YT38ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1KR53+c0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1KR53+c0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BF7C433C7;
	Tue, 27 Feb 2024 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1709073157;
	bh=rpVNrVlxcl6g9cMUAeG0cQt/e1FxeJkvZS/bhGYlG3o=;
	h=Date:From:To:Subject:From;
	b=1KR53+c06e4iOQ9XfBg0z0+Mq6oTgprAHKbWKZuQzwZoZL4n3XMKuF5vyVuvO9AJ7
	 j0w5NA8ysKHO1hE0oNi8F6oJwLErgoc20ZZdrdpMU4RJH4r1jb5NxgQfRkohMiWwjG
	 qu/YXzcBf7aA79jtiRsgb5k8qzusR75JHpgDINs8=
Date: Tue, 27 Feb 2024 17:32:34 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, tools@kernel.org, workflows@vger.kernel.org
Subject: Toy/demo: using ChatGPT to summarize lengthy LKML threads (b4
 integration)
Message-ID: <20240227-flawless-capybara-of-drama-e09653@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I was playing with shell-gpt and wrote a quickie integration that would allow
retrieving (slimmed-down) threads from lore, feeding them to ChatGPT, and
asking it to provide some basic analysis of the thread contents. Here's a
recorded demo session:

https://asciinema.org/a/643435

A few notes:

1. This is obviously not a replacement for actually reading email, but can
   potentially be a useful asset for a busy maintainer who just wants a quick
   summary of a lengthy thread before they look at it in detail.
2. This is not free or cheap! To digest a lengthy thread, you can expect
   ChatGPT to generate enough tokens to cost you $1 or more in API usage fees.
   I know it's nothing compared to how expensive some of y'all's time is, and
   you can probably easily get that expensed by your employers, but for many
   others it's a pretty expensive toy. I managed to make it a bit cheaper by
   doing some surgery on the threads before feeding them to chatgpt (like
   removing most of the message headers and throwing out some of the quoted
   content), but there's a limit to how much we can throw out before the
   analysis becomes dramatically less useful.
3. This only works with ChatGPT-4, as most threads are too long for
   ChatGPT-3.5 to even process.

So, the question is -- is this useful at all? Am I wasting time poking in this
direction, or is this something that would be of benefit to any of you? If the
latter, I will document how to set this up and commit the thread minimization
code I hacked together to make it cheaper.

Best regards,
-K
