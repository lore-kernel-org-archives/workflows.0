Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FEA175A98;
	Sun, 26 Apr 2026 01:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777165946; cv=none; b=VfCS6tV/dAJJ5XdZXxRKzva4RRNdkgrsQpoEhTcczo/VO9QrLGkRpXkIPSKXuWpWeKcp1RlHJs6L7axM9Mn6lUtoElbG3OdwixmOKESMFrGXLUl5eYW2tTbBxBg/0VW9UytzOgKC7oT74vrTGUvK1m4ob2ODEnqhBoVMujtd+7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777165946; c=relaxed/simple;
	bh=rv95g0JSuH6oeUZBVQ2OZkSW81HV7jEKkjk85nUPVIg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gUQjokyaW4ZWKydJYaKdeqjtra9Wb+XGaeYocRI+hhNWhXtJd1hPLnloXZOy9hvYGtSIJMoOlgPtywMYw/GYa+MpW6ykQAg9MK6pNMswmp8tqBnD++4UDMwrLw8dAPPCKrUstxvJQGdVn4LVWr0VVVJZagE94WiK4PSCKAk6gdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf14.hostedemail.com (lb01b-stub [10.200.18.250])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id C1CAAA047B;
	Sun, 26 Apr 2026 01:12:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf14.hostedemail.com (Postfix) with ESMTPA id DD8F53D;
	Sun, 26 Apr 2026 01:12:14 +0000 (UTC)
Message-ID: <1f8e71e117fbe7ff43723a863fd598c0568c4938.camel@perches.com>
Subject: Re: [PATCH v3] checkpatch: add --json output mode
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>
Cc: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, mricon@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, apw@canonical.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sat, 25 Apr 2026 18:12:13 -0700
In-Reply-To: <ae1XUFURKgdG6lGh@laps>
References: <20260408172435.1268067-1-sashal@kernel.org>
	 <20260425200431.4088895-1-sashal@kernel.org>
	 <c8722587377c3bc4be03f7d04bd45912@perches.com> <ae1XUFURKgdG6lGh@laps>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DD8F53D
X-Rspamd-Server: rspamout06
X-Stat-Signature: fnfk76ecm5oufiyce83w8fc3pw1b7gke
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+yU1rfdJqodHgR3j68LLnK+I4seFBSOz4=
X-HE-Tag: 1777165934-923220
X-HE-Meta: U2FsdGVkX19JAIjP2QXmuQ/wdATTjTu3cqleEPIsG9VM4AWgbSTbCXhOjSbDKxF4hDYrQ3UKBDMIGJ39w+ioDJ3To03XUkKme2nAq4FTFDqmhrG4BlSvdMLH2wXSMnqE9xKeUe3R63YLGMZjXqYW94hz8gquwi62GSe+tb5yHZH5PrSNsHV/4L9WVx2ufMrJWFlQjh4DZK7V16PcSfw1CJnlw0Crdw7nw1JveI7QEplGa8QNbr6kv5scuMarFzQ0X4G8C2sGL7E1q5y7b4v/+/yeiQvDZP4H93vRfhdB9Zr3am8i7ZbX86AY7862iXtc

On Sat, 2026-04-25 at 20:07 -0400, Sasha Levin wrote:
> On Sat, Apr 25, 2026 at 02:52:35PM -0700, Joe Perches wrote:
> On 2026-04-25 13:04, Sasha Levin wrote:
> Add a --json flag to checkpatch.pl that emits structured JSON output,
> > > making results machine-parseable for CI systems, IDE integrations, an=
d
> > > AI-assisted code review tools.
> > []
> > > A separate --json-pretty flag emits the same JSON in a pretty-printed
> > > (indented, multi-line) form for human reading
> > Why not just always use pretty?
> > Would a script care?
>=20
> Who's the intended consumer for the --json-pretty?
>=20
> I my mind, --json is there to make it easier for tooling to process the o=
utput.

Agree, but does the pretty output make it harder for tooling?
