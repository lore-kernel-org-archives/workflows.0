Received: from relay.hostedemail.com (smtprelay0013.hostedemail.com [216.40.44.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2015133D4EC;
	Sat, 25 Apr 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777153966; cv=none; b=rPzq+bzej+M0zJMFK+4DIVkI/XKOife26dBdrzSjyINaXJ7CmBXSAss+PjJcmzoU1d65U8SyGIoXpgORsNNBm6ZTht3lNJQPwm0hA37XbHz7SeXqF1GCmUxLz8fmzspf0s9eyDYIEU3iGmMyVW/JJX+IoqWBwS4ghujAcd7tK2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777153966; c=relaxed/simple;
	bh=UhL41mXg8ziVEqtgu83cmbHSWGzlj4WOdVNq/8KGSgc=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Khhbt6GJJ4YjLD55b3C1oQaTeT+1CnPNQf+DNG1e5zRn2ocleFzU2O6eDeGcvHwGozcMpoRAcGbV3ATs7ouD+kMJToNXn+BdfbF+py817jefNtUZD5EkC9EIT+kg9OLGcBG5uQCNvQPs8gSJyMq4VKC1La1alBLWidIJxfyAnt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf07.hostedemail.com (lb01b-stub [10.200.18.250])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id ABB788B75D;
	Sat, 25 Apr 2026 21:52:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf07.hostedemail.com (Postfix) with ESMTPA id EAF9020032;
	Sat, 25 Apr 2026 21:52:35 +0000 (UTC)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 25 Apr 2026 14:52:35 -0700
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, mricon@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] checkpatch: add --json output mode
In-Reply-To: <20260425200431.4088895-1-sashal@kernel.org>
References: <20260408172435.1268067-1-sashal@kernel.org>
 <20260425200431.4088895-1-sashal@kernel.org>
Message-ID: <c8722587377c3bc4be03f7d04bd45912@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: tiuciup4461hf6a7gb7191af384um5i9
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: EAF9020032
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/qOiV58/uLk+42lJQkNJieerRBMCYA82c=
X-HE-Tag: 1777153955-898928
X-HE-Meta: U2FsdGVkX1/rKdd50ZWp8CyvIs0bFe5epmzPoNvjz73JP0od6DBM81G+zDQ+i1G8UK6HJ6rNJQSicrAW0Tkvjr7l3sIqzuP+aDtN4vwPCSB4BIxzv+vMmwUxghggsL+wWCp8IjL1527twnG387FIFGRAuBIRevGhTo2St5a0Fh5t4x5U3j3TQeIc9pReDd5l2TrOLxQaYNEoRV6pS1RjmVMUHtB/i26ygVcHXVl3Ya3/i5FoCey4ezt8NrEtf6Naqf1+zwebmAUPOL8yQCxptg==

On 2026-04-25 13:04, Sasha Levin wrote:
> Add a --json flag to checkpatch.pl that emits structured JSON output,
> making results machine-parseable for CI systems, IDE integrations, and
> AI-assisted code review tools.
[]
> A separate --json-pretty flag emits the same JSON in a pretty-printed
> (indented, multi-line) form for human reading

Why not just always use pretty?
Would a script care?
