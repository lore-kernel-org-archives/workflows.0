Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC818A6A9
	for <workflows@vger.kernel.org>; Mon, 30 Dec 2024 22:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735596080; cv=none; b=KdCgFTL1FmhkviDsdPkxkb29S/StuVk2ahbbRvldqn7ICNLPJ17ypRKEfeYNog+lVgEf2FZaB0CIBLFgMx9EoFUtctfO0PW/sXDGcfRyjzWKggO4ZUpd4SGtnIgBPLjmtJ5HiEYLiNwuLmj0q0avybPQI/SAIOB4zheY3hvqUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735596080; c=relaxed/simple;
	bh=Hw4Q+dYp/Ksxq48D0ekxJxakIplhL9ySojwi08v4A+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gVsJFj6nC7ab4TZdKTi5x13wlToQpy2TaDT3NxFMa3pjA8SmMglRF1jeIa7CHvvlysAdf1WyoFLdwI+Gm0WLg0mVEDFC+kenBpM0YOnCdRrefhmKpl28NM3vobUgFxG39xriGJ3XmSTSP3KZ1Bhz0eWNO7I265NhJKc4xE33I6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FfbsoGNv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FfbsoGNv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A6EC4CED0;
	Mon, 30 Dec 2024 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735596080;
	bh=Hw4Q+dYp/Ksxq48D0ekxJxakIplhL9ySojwi08v4A+I=;
	h=Date:From:To:Cc:Subject:From;
	b=FfbsoGNvxX3PGGL6HODB3dqmhXPQRLjRJBq+I4Elw74+BaWjSw7rQge6kQBWcigSW
	 u0ezREISk7I+2LD4N7F9wAWCx7W79Qau5jFwwfaKWV4bAxGjf4I9jGRTHf/btawUOY
	 MQqHR7D7BWOmJX9l+je/8Zj0Dykd5pkZGw0VS9Ro=
Date: Mon, 30 Dec 2024 17:01:16 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@kernel.org, workflows@vger.kernel.org
Cc: choypoy@linuxfoundation.org
Subject: Putting my maintainer support hat on
Message-ID: <20241230-loyal-jumping-marmoset-0bde8f@lemur>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, all:

I'd like to semi-formally announce that everything is finally in place for me
to take a more official "Linux maintainer support" role at the Linux
Foundation. I know we've talked about it multiple times before and I brought
it up at several maintainer summits, but it took a while to officially mold it
into something tangible. I would like to thank the Linux Foundation TAB for
making this possible.

In terms of impact, it's more of what I've already been doing:

- working on maintainer tooling (b4, patchwork-bot, bugspray)
- writing maintainer and workflow documentation
- helping new maintainers get on board
- taking care of the maintainer keyring

The key difference will be that it's to become my primary focus as opposed to
being done on a time-available basis with infrastructure tasks always taking
priority. You may have noticed that I haven't had much of a chance to work on
b4 over the past few months because we're deep in the middle of planned
infrastructure upgrades and migrations, replacing large swathes of legacy
Puppet-managed CentOS systems with Ansible and RHEL9.

However, I have more help available to me now, so starting in the new year I
should be able to focus primarily on maintainer-related tasks again. For this
reason, I would like you all to meet Chris Hoy Poy, who is now a permanent
member of our IT team and who will be taking over large parts of my
infrastructure duties. Chris lives in Perth, Australia, which I'm sure will
please those of you in the Asia-Pacific time zones. Chris is not new to our IT
team, but he has been working with other projects managed by LF IT (and I'm
sure he won't quite miss the Atlassian stack). You'll probably hear from Chris
the next time you email the kernel helpdesk.

With Chris taking over many of my infrastructure duties, I will be able to
focus more on the following goals:

- continue b4 work:

  - b4 review: an interactive mode that would let maintainers quickly review
    series and send tags for submitted series and pull requests
  - b4 keyring management: with the aim to simplif key management for
    maintainers, so they can easily verify that patches they receive haven't
    been tampered with
  - outstanding bug fixes and improvements that have been piling up

- continue bugspray bot development

  - work with first-contact volunteers to further couple mailing lists and
    bugzilla features
  - expand to allow bridging with other forges, not just bugzilla

- lore: provide prefiltered inboxes for subsystems

  - this is undergoing early trials in the form of query-driven patchwork
    projects, e.g. see https://git.kernel.org/pub/scm/infra/patchwork/lei-queries.git/tree/
  - the goal is to provide pre-filtered query based inboxes and feeds for
    maintainers to pull via pop3 or lei, allowing for easier co-maintainership
    and easier ramp-up for new maintainers

- lore: what’s new summarizer

  - LLM-driven daily "what's new" summary for query-based feeds, IFF that
    actually proves useful and isn't just a waste of everyone's time and
    computing resources. Early trials show the usual 80/20 breakdown of "80%
    of the time it's really good, but the remaining 20% of the time it's
    hilariously/dangerously wrong."

- forge integrations: Forgejo

  - I've not had a chance to spend much time on this, but Fedora's upcoming
    adoption of Forgejo is going to be interesting to watch.
    https://lwn.net/Articles/1000751/

Plus whatever feedback I get from maintainers -- my goal is to work on things
that bug you most, not what I think is cool. :)

Wishing you all an excellent new year,
-K
