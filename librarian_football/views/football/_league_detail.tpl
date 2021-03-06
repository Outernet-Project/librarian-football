<%namespace file="/ui/nojs.tpl" name="nojs"/>

<div class="tabs">
    <ul class="tab-links">
        <li class="active"><a href="#tab-schedule">Fixtures</a></li>
        <li><a href="#tab-standings">Standings</a></li>
    </ul>
    <div class="tab-content">
        <div id="tab-schedule" class="tab active">
            ${league_schedule(league.fixtures, league.current_matchday)}
        </div>
        <div id="tab-standings" class="tab">
            ${league_standings(league.teams)}
        </div>
    </div>
</div>

<%def name="league_schedule(fixtures, current_matchday)">
<div class="matchday-sections dashboard-sections o-collapsible">
    % for matchday in fixtures:
    <div class="matchday-section dashboard-section o-collapsible-section ${nojs.cls_toggle('matchday' + str(loop.index), 'o-collapsed', flip=True)}">
        <h2 class="o-collapsible-section-title">
            <a href="${nojs.comp_url('matchday' + str(loop.index))}" role="button">
                <span class="icon"></span>
                Week ${loop.index + 1}
            </a>
        </h2>
        <div class="o-collapsible-section-panel">
            % if len(matchday) == 0:
            <div class="football-error">
                Sorry, no fixtures are available for this match week. Please check back later.
            </div>
            % else:
            <table class="schedule-table">
                <tr class="schedule-table-row">
                    <th>Date Time</th>
                    <th>Home Team</th>
                    <th>Home Goals</th>
                    <th>Away Goals</th>
                    <th>Away Team</th>
                </tr>
                % for match in matchday:
                <tr class="schedule-table-row">
                    <td>${match.date}</th>
                    <td>${match.home_team_name}</td>
                    <td>${match.home_team_goals}</td>
                    <td>${match.away_team_goals}</td>
                    <td>${match.away_team_name}</td>
                </tr>
                % endfor
            </table>
            % endif
        </div>
    </div>
    % endfor
</div>
</%def>

<%def name="league_standings(teams)">
<div class="standings-table-container">
    % if len(teams) == 0:
    <div class="football-error">
        Sorry, rankings are not available at this time. Please check back later.
    </div>
    % else:
    <table class="standings-table">
        <tr class="standings-table-row">
            <th>No.</th>
            <th>Team Name</th>
            <th>Wins</th>
            <th>Losses</th>
            <th>Draws</th>
        </tr>
        % for t in teams:
        <tr class="standings-table-row">
            <td>${t.position}</td>
            <td>${t.name}</td>
            <td>${t.wins}</td>
            <td>${t.losses}</td>
            <td>${t.draws}</td>
        </tr>
        % endfor
    </table>
    % endif
</div>
</%def>

<%def name="scrollable_matchdays(fixtures, current_matchday)">
<ul id="matchday-tab-set" class="scroll_tabs_theme_light">
    % for matchday in fixtures:
    <li>Week ${loop.index + 1}</li>
    % endfor
</ul>
</%def>