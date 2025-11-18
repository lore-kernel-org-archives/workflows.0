Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC333C50B;
	Tue, 18 Nov 2025 16:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763484735; cv=none; b=ABnb7Ov0yOBl9L54Ga96YygspejnGcJXnAOQj9AMF5yE8VhK+sXNgepPucfKzSq3EN8pEaIx9Ji85j3N3iKsbV8IfR96Fqy+OU7HEvkMiCcyvjmepSgcn8ehQosTjhl5MrzKEV3NFAFXWtEzamS8zS+m1Sj920Eli7L66UfocGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763484735; c=relaxed/simple;
	bh=p0EpD1fW+Coy14i3peXlwoHGWBVxJJqEkJr2kyYV34E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swjh6PSJi6qpSa2rhE3Rd23+tTc86f2uba8Zig5Dv4NIX3kP7Q+XbxZ1u20DW+MbQ/0/D6BmZwWRZ0caACH9AwIS2cTCmrt79La28QrcbH9DfvQlvtdCQFBgoptBZGDHBhn9mplwsHSboFosdm+iJpNQ/TAL2yRnBRRc+FxjGUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYefdWE0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYefdWE0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94181C4CEF1;
	Tue, 18 Nov 2025 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763484735;
	bh=p0EpD1fW+Coy14i3peXlwoHGWBVxJJqEkJr2kyYV34E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYefdWE0+qv0kREmyt61Q3uZ94Q6eTquDpJhbc/rdNmI/rZOQjXpnt0PP7W5qXFzI
	 nXPnSu7MVaWYXTuKMUuWu7v+urPkz+IUuxDewCTTk1rec/TGcECcwKx1PnnJWWkUUB
	 3zl8KQLteumbkUFCckqE2j9nQ1OuurST4TGhCYjdGDRrWNfW/RI3mBvGtcbXF42HKf
	 odgKz+aGRMioAoM8k43w55CF9OZdZttzkYkGW5z8tfGIWYNzf2PK8qAtjMQ+Xo+Ce5
	 zFj/efqeNjE3I2qeCmWy2Cqal/UxlS7a2CB/bS7qM5CpZ60D6KIatGQUkJdxUQNatD
	 N1mdMslMNi5pw==
Date: Tue, 18 Nov 2025 11:52:12 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, josh@joshtriplett.org, kees@kernel.org,
	konstantin@linuxfoundation.org, linux-kernel@vger.kernel.org,
	rostedt@goodmis.org, workflows@vger.kernel.org, joe@perches.com,
	rdunlap@infradead.org
Subject: Re: [PATCH v3] README: restructure with role-based documentation and
 guidelines
Message-ID: <aRykPFH0sIfmARvs@laps>
References: <20251117213801.4077535-1-sashal@kernel.org>
 <87wm3n47u6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87wm3n47u6.fsf@trenco.lwn.net>

On Tue, Nov 18, 2025 at 09:35:29AM -0700, Jonathan Corbet wrote:
>Sasha Levin <sashal@kernel.org> writes:
>
>> Reorganize README to provide targeted documentation paths for different user
>> roles including developers, researchers, security experts, maintainers, and AI
>> coding assistants. Add quick start section and essential docs links.
>>
>> Include proper attribution requirements for AI-assisted contributions using
>> Assisted-by tags with agent details and tools used.
>>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>> Changes in v3:
>> - Replace "Agentic Coding" terminology with clearer "AI Coding Assistants"
>> - Add concrete examples of proper Assisted-by tag usage with multiple formats
>> - Add "Bad examples" section showing anti-patterns to avoid
>> - Add detailed tool categorization distinguishing specialized vs basic tools
>> - Add explicit format specification: $AGENT_NAME:$MODEL_VERSION [$TOOL1] ...
>> - Expand section description to clarify it applies to both AI tools and
>>   developers using AI tools
>>
>>  README                | 212 +++++++++++++++++++++++++++++++++++++++---
>>  scripts/checkpatch.pl |   1 +
>>  2 files changed, 202 insertions(+), 11 deletions(-)
>
>Overall I really like this change.  We could quibble forever about the
>details, but that's probably not worthwhile.

Thanks Jon!

What would you say about taking this patch (assuming this falls under the
Documentation subsystem) if I completely drop the AI parts for now?

>That said, I have one quibble :)
>
>> +Examples of Proper Attribution:
>> +
>> +Good examples:
>> +  Assisted-by: AI-Tool:model-version-1.0 coccinelle
>> +  Assisted-by: AI-Assistant:v2.5.0
>> +  Assisted-by: Code-Helper:model-2024-04-09 sparse smatch
>> +  Assisted-by: ML-Agent:version-2024-11
>> +
>> +Bad examples (DO NOT USE):
>> +  Assisted-by: AI                          # Too vague
>> +  Assisted-by: AI-Tool coccinelle git      # Don't list basic tools
>> +  Signed-off-by: AI Assistant <ai@...>     # NEVER - AI cannot sign off
>
>I don't think this belongs here - we don't have examples of good SOB
>lines - or of anything else.  What this needs, instead, is a link to
>Dave's tools document once that goes in.

Makes sense.

>(We also, in truth, do not yet have a consensus on what the attribution
>tags should be, and here isn't the place to try to form one.)

Ack - I've posted this v3 in response to tglx's ask on Dave's doc about having
a standard tag for this to gather more input prior to LPC.

-- 
Thanks,
Sasha
