Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C413F2C0F6D;
	Sun, 26 Apr 2026 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777196882; cv=none; b=Lpri5B6Y0cawIGVxiOtTnC1mCO6YxnjgIl8Jixa3wZBEA114NbbOJKS7oZVkPGS9aFxPVxXfxaEya12OmkLujEBY/VQiXJQlxd5JCiGAmZ4FJCIUlMGY7thHG5CbWPGKIfZSZP7Xla4DKFHfA1EceNbRTY5EH1BsWTXTtmHONT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777196882; c=relaxed/simple;
	bh=7JOrDVh6TB/L9jeyBO3Xkbxew1LnHEVOKgwzPr3wb/M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GKoeSGj14iw1IM84XtRv9V3VTvjiYCqAL60f9we6j8fH95PxlSU6zLF5YUKjrhbEynUyTUpkpGo0XZ0S5a1OWtdA23/jj5b25PHFJ8GrjymrXaI3eQPuKbZt4JEZcMqIg3bB33r5/AfJju799P31ep/lbssq2UvQ6KIduB7Ve0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (lb01b-stub [10.200.18.250])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 7241A8B383;
	Sun, 26 Apr 2026 09:47:54 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id BE73260011;
	Sun, 26 Apr 2026 09:47:51 +0000 (UTC)
Message-ID: <01ba7d10ebbac30d1325d23ecdc8fb63c614e0d1.camel@perches.com>
Subject: Re: [PATCH v3] checkpatch: add --json output mode
From: Joe Perches <joe@perches.com>
To: Sasha Levin <sashal@kernel.org>, dwaipayanray1@gmail.com, 
	lukas.bulwahn@gmail.com
Cc: mricon@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	apw@canonical.com, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Sun, 26 Apr 2026 02:47:50 -0700
In-Reply-To: <20260425200431.4088895-1-sashal@kernel.org>
References: <20260408172435.1268067-1-sashal@kernel.org>
	 <20260425200431.4088895-1-sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: BE73260011
X-Stat-Signature: umxo31hpdi7fg6xawwfw159qcy3uraoy
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18dvq6Drm8d51f5kR9uzwoYSmJ/wUNaASU=
X-HE-Tag: 1777196871-967770
X-HE-Meta: U2FsdGVkX1/8IXMSr4DT7TQ87uT2mMFcW5C02vKWfhh5C+/U7xpzIxaWbKQ3R58YwVoEzW84XVwKWuyR5qU2AqbAHV3pzt2Za4GGTpvGeTp5Gr3iNNPTsU5u/PsUFxfms1JS0a8iS8d4qSvukRfnBmAwswR8xyJZ8vqJw4ctmPRIdJS5S94iJx039JFKwLagNpU7DXot96GOoajd3cCiCfYyOW0Quy9wbRGTCS+uYnr5/opCs9CmZEmL7Uvgv7eTteFLcNa17U9lE+AenC2QR5hu2xQDms4X8AKIXTtduGBd7jSGJlUKK/c0VdIteMjK

On Sat, 2026-04-25 at 16:04 -0400, Sasha Levin wrote:

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2403,6 +2426,24 @@ sub report_dump {
>  	our @report;
>  }
> =20
> +sub json_print_result {
> +	my ($filename, $total_errors, $total_warnings, $total_checks,
> +	    $total_lines, $issues, $used_types, $ignored_types) =3D @_;
> +	my %result =3D (
> +		filename       =3D> $filename,
> +		total_errors   =3D> $total_errors,
> +		total_warnings =3D> $total_warnings,
> +		total_checks   =3D> $total_checks,
> +		total_lines    =3D> $total_lines,
> +		issues         =3D> $issues,
> +	);
> +	$result{used_types}    =3D $used_types    if (defined $used_types);
> +	$result{ignored_types} =3D $ignored_types if (defined $ignored_types);
> +	my $json_encoder =3D JSON::PP->new->canonical->utf8;

Maybe canonical isn't great as it outputs keys in alphabetic order.
The output may be more sensible in the defined order.
